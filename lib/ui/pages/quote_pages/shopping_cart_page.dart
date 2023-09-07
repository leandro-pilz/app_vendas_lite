import 'package:flutter/material.dart';

import '/ui/widgets/app_scaffold.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Carrinho',
      child: Center(
        child: Text('Carrinho de compras'),
      ),
    );
  }
}
