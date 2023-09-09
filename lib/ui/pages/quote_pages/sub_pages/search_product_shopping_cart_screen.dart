import 'dart:developer';

import 'package:app_vendas_lite/ui/widgets/qantity_field_with_actions.dart';
import 'package:flutter/material.dart';

class SearchProductShoppingCartScreen extends StatefulWidget {
  const SearchProductShoppingCartScreen({super.key});

  @override
  State<SearchProductShoppingCartScreen> createState() => _SearchProductShoppingCartScreenState();
}

class _SearchProductShoppingCartScreenState extends State<SearchProductShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PESQUISA DE PRODUTOS'),
        QuantityFieldWithActions(
          multipleBatch: 3,
          isSlim: true,
          onChanged: (value) {
            log('Quantidade: $value');
          },
        ),
      ],
    );
  }
}
