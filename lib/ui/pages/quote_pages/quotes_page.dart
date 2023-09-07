import 'package:app_vendas_lite/ui/widgets/list_view_custom.dart';
import 'package:flutter/material.dart';

import '/entities/customer_entity.dart';
import '/entities/form_payment_entity.dart';
import '/entities/payment_term_entity.dart';
import '/ui/utils/auto_complete_data.dart';
import '/ui/utils/dropdown_data.dart';
import '/ui/utils/extensions.dart';
import '/ui/widgets/dropdown_custom.dart';
import '../../data.dart';
import '../../utils/constants.dart';
import '../../utils/infinity_scroll_listener.dart';
import '../../utils/labels.dart';
import '../../utils/text_style_utils.dart';
import '../../utils/util.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/auto_complete_custom.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late Function(Function(CustomerEntity customer)) onSelectedCustomer;
  late CustomerEntity customerSelected;
  late FormPaymentEntity formPaymentSelected;
  late PaymentTermEntity paymentTermSelected;
  late InfinityScrollListener scrollController;
  late bool isProgress;

  @override
  void initState() {
    isProgress = false;
    final date = DateTime.now();
    formPaymentSelected = formPayments.first;
    paymentTermSelected = formPaymentSelected.paymentTerms.first;
    customerSelected = CustomerEntity(externalId: '', name: '', cpfCnpj: '', status: false, createAt: date, updateAt: date);
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
      onFloatActionButtonPressed: (){

      },
      iconFloatAction: Icons.add,
      child: Column(
        children: [
          AutoCompleteCustom(
            onSelected: (data) {
              customerSelected = customers.firstWhere((element) => element.externalId == data.id);
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
          Expanded(
            child: ListViewCustom(
              isProgress: isProgress,
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
