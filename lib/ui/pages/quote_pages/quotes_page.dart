import 'package:app_vendas_lite/entities/customer_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/ui/widgets/text_field_custom.dart';
import '../../utils/constants.dart';
import '../../widgets/app_scaffold.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  CustomerEntity? customerSelected;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Cotações',
      child: Column(
        children: [
          TextFieldCustom(
            text: customerSelected == null ? '' : customerSelected?.name ?? '',
            label: 'Cliente',
            onTap: () async {
              final result = await context.pushNamed('cliente', extra: true);
              if (result != null) {
                setState(() {
                  customerSelected = (result as CustomerEntity);
                });
              }
            },
          ),
          SizedBox(height: kMediumPadding),
          TextFieldCustom(text: 'BOLETO 30 DIAS', label: 'Condição de pagamento'),
        ],
      ),
    );
  }
}
