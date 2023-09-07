import 'package:flutter/material.dart';

import '/entities/customer_entity.dart';
import '/ui/utils/auto_complete_data.dart';
import '/ui/utils/extensions.dart';
import '/ui/widgets/text_field_custom.dart';
import '../../data.dart';
import '../../utils/constants.dart';
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

  @override
  void initState() {
    final date = DateTime.now();
    customerSelected = CustomerEntity(name: '', cpfCnpj: '', status: false, createAt: date, updateAt: date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Cotações',
      child: Column(
        children: [
          AutoCompleteCustom(
            onSelected: (customer) {
              debugPrint('Cliente selecionado ${customer.title}');
            },
            onChanged: (list) async {
              list(Future.value(
                customers
                    .map(
                      (e) => AutoCompleteData(
                        data: e,
                        filter: e.filter(),
                        title: e.name,
                        subTitle: e.cpfCnpjFormatted(),
                      ),
                    )
                    .toList(),
              ));
            },
          ),
          const SizedBox(height: kMediumPadding),
          const TextFieldCustom(text: 'BOLETO 30 DIAS', label: 'Condição de pagamento'),
        ],
      ),
    );
  }
}
