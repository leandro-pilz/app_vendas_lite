import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/entities/customer_entity.dart';
import '/entities/form_payment_entity.dart';
import '/entities/payment_term_entity.dart';
import '/entities/quotation_entity.dart';
import '/ui/data.dart';
import '/ui/utils/auto_complete_data.dart';
import '/ui/utils/constants.dart';
import '/ui/utils/dropdown_data.dart';
import '/ui/utils/extensions.dart';
import '/ui/utils/infinity_scroll_listener.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/routes_name_app.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/utils/util.dart';
import '/ui/widgets/app_scaffold.dart';
import '/ui/widgets/auto_complete_custom.dart';
import '/ui/widgets/dropdown_custom.dart';
import '/ui/widgets/list_view_custom.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late Function(Function(CustomerEntity customer)) onSelectedCustomer;
  CustomerEntity? customerSelected;
  late FormPaymentEntity formPaymentSelected;
  late PaymentTermEntity paymentTermSelected;
  late InfinityScrollListener scrollController;
  late bool isProgress;

  @override
  void initState() {
    isProgress = false;
    formPaymentSelected = formPayments.first;
    paymentTermSelected = formPaymentSelected.paymentTerms.first;
    scrollController = InfinityScrollListener(
      onLoadMore: () {
        setState(() {
          isProgress = true;
          _timeLoad();
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  _timeLoad() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Cotações',
      usePaddingDefault: true,
      onFloatActionButtonPressed: customerSelected != null
          ? () {
              final date = DateTime.now();
              final quotation = QuotationEntity(
                id: date.millisecondsSinceEpoch,
                quotationNumber: '001',
                amount: 0.0,
                customer: customerSelected!,
                formPayment: formPaymentSelected,
                paymentTerm: paymentTermSelected,
                status: true,
                createAt: date,
                updateAt: date,
                items: [],
              );

              context.goNamed(shoppingCartRouteName, extra: quotation);
            }
          : null,
      iconFloatAction: Icons.add_shopping_cart,
      body: Column(
        children: [
          AutoCompleteCustom(
            onSelected: (data) {
              setState(() {
                customerSelected = customers.firstWhere((element) => element.externalId == data.id);
              });
            },
            onChanged: (list) async {
              list(Future.value(
                customers
                    .map((e) => AutoCompleteData(
                          id: e.externalId!,
                          filter: e.filter(),
                          title: e.name,
                          subTitle: e.cpfCnpjFormatted(),
                        ))
                    .toList(),
              ));
            },
            onClear: () {
              setState(() {
                customerSelected = null;
              });
            },
          ),
          const SizedBox(height: kMediumPadding),
          DropDownCustom(
            initialItem: formPaymentSelected.externalId!,
            label: lPaymentMethods,
            list: formPayments.map((e) => DropDownData(id: e.externalId!, title: e.name)).toList(),
            onChanged: (id) {
              final selected = formPayments.firstWhere((element) => element.externalId == id);
              setState(() {
                formPaymentSelected = selected;
                paymentTermSelected = formPaymentSelected.paymentTerms.first;
              });
            },
          ),
          const SizedBox(height: kMediumPadding),
          DropDownCustom(
            initialItem: paymentTermSelected.externalId!,
            label: lPaymentConditions,
            list: formPaymentSelected.paymentTerms.map((e) => DropDownData(id: e.externalId!, title: e.name)).toList(),
            onChanged: (id) {
              final selected = formPaymentSelected.paymentTerms.firstWhere((element) => element.externalId == id);
              setState(() {
                paymentTermSelected = selected;
              });
            },
          ),
          const SizedBox(height: kMediumPadding),
          const Row(
            children: [
              Text('$lQuotation realizadas', style: mediumW500Style),
              Expanded(
                child: Divider(
                  indent: 8.0,
                  color: Colors.black38,
                  height: 3.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: kSmallPadding),
          Expanded(
            child: ListViewCustom(
              isProgress: isProgress,
              useBottomSpace: true,
              list: quotations,
              scrollController: scrollController,
              child: (index) {
                return Container(
                  width: double.infinity,
                  color: listItemBackgroundColor(index: index),
                  padding: const EdgeInsets.all(kSmallPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        quotations[index].customer.name,
                        style: largeW600Style,
                      ),
                      Text('$lNumber: ${quotations[index].quotationNumber}'),
                      Text('$lPaymentCondition: ${quotations[index].formPayment?.name} / ${quotations[index].paymentTerm?.name}'),
                      Text('$lCreateAt: ${quotations[index].createAt?.maskDateAndTime()}'),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
