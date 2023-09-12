import 'package:flutter/material.dart';

import '/entities/customer_entity.dart';
import '/ui/data.dart';
import '/ui/utils/auto_complete_data.dart';
import '/ui/utils/constants.dart';
import '/ui/utils/extensions.dart';
import '/ui/utils/infinity_scroll_listener.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/messages.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/utils/util.dart';
import '/ui/widgets/app_scaffold.dart';
import '/ui/widgets/auto_complete_custom.dart';
import '/ui/widgets/list_view_custom.dart';
import '/ui/widgets/show_calendar_custom.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late DateTime initialDate;
  late DateTime firstDate;
  late DateTime lastDate;
  late bool isProgress;
  late InfinityScrollListener scrollController;
  CustomerEntity? customerSelected;

  @override
  void initState() {
    firstDate = DateTime.now();
    initialDate = firstDate;
    lastDate = DateTime.now().add(const Duration(days: 30));
    isProgress = false;
    scrollController = InfinityScrollListener(
      onLoadMore: () {
        setState(() {
          isProgress = true;
          _timeLoad();
        });
      },
      onOffSetListener: (offSet) {},
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
      title: lOrders,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          ShowCalendarCustom(
            onDateChanged: (date) => initialDate = date,
            initialDate: initialDate,
            label: lCreationDate,
          ),
          const SizedBox(height: kMediumPadding),
          const Divider(
            color: Colors.black38,
            height: 3.0,
          ),
          const SizedBox(height: kSmallPadding),
          Expanded(
            child: ListViewCustom(
              isProgress: isProgress,
              useBottomSpace: true,
              list: customerSelected == null ? [] : quotations,
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
              textNotFoundData: selectCustomerToStartSearch,
            ),
          )
        ],
      ),
    );
  }
}
