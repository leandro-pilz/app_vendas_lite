import 'package:flutter/material.dart';

class SearchProductShoppingCartScreen extends StatefulWidget {
  const SearchProductShoppingCartScreen({super.key});

  @override
  State<SearchProductShoppingCartScreen> createState() => _SearchProductShoppingCartScreenState();
}

class _SearchProductShoppingCartScreenState extends State<SearchProductShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('PESQUISA DE PRODUTOS'),
    );
  }
}
