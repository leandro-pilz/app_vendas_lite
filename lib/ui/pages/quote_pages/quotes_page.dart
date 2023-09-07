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
import '../../utils/labels.dart';
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

  @override
  void initState() {
    final date = DateTime.now();
    formPaymentSelected = formPayments.first;
    paymentTermSelected = formPaymentSelected.paymentTerms.first;
    customerSelected = CustomerEntity(externalId: '', name: '', cpfCnpj: '', status: false, createAt: date, updateAt: date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Cotações',
      child: ListView(
        children: [
          AutoCompleteCustom(
            onSelected: (customer) {
              debugPrint('Cliente selecionado ${customer.title}');
            },
            onChanged: (list) async {
              list(Future.value(
                customers
                    .map((e) => AutoCompleteData(
                          data: e,
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
            label: lPaymentMethods,
            list: formPaymentSelected.paymentTerms.map((e) => DropDownData(id: e.externalId!, title: e.name)).toList(),
            onChanged: (id) {
              final selected = formPaymentSelected.paymentTerms.firstWhere((element) => element.externalId == id);
              setState(() {
                paymentTermSelected = selected;
              });
            },
          ),
        ],
      ),
    );
  }
}
