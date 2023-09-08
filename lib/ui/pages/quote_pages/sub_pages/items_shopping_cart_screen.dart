import 'package:flutter/material.dart';

class ItemsShoppingCartScreen extends StatefulWidget {
  const ItemsShoppingCartScreen({super.key});

  @override
  State<ItemsShoppingCartScreen> createState() => _ItemsShoppingCartScreenState();
}

class _ItemsShoppingCartScreenState extends State<ItemsShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('ITENS DO CARRINHO'),
    );
  }
}
