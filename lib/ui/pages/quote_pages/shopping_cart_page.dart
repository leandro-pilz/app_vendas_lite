import 'package:flutter/material.dart';

import '/ui/pages/quote_pages/sub_pages/checkout_shopping_cart_screen.dart';
import '/ui/pages/quote_pages/sub_pages/items_shopping_cart_screen.dart';
import '/ui/pages/quote_pages/sub_pages/search_product_shopping_cart_screen.dart';
import '/ui/utils/labels.dart';
import '/ui/widgets/app_scaffold.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late int currentPageIndex;

  @override
  void initState() {
    currentPageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Carrinho',
      body: <Widget>[
        const SearchProductShoppingCartScreen(),
        const ItemsShoppingCartScreen(),
        const CheckoutShoppingCartScreen(),
      ][currentPageIndex],
      onNavigationSelected: (index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      currentPageIndex: currentPageIndex,
      navigationDestination: const <Widget>[
        NavigationDestination(icon: Icon(Icons.search), label: lProductSearch),
        NavigationDestination(icon: Icon(Icons.shopping_cart), label: lCartProducts),
        NavigationDestination(icon: Icon(Icons.monetization_on_outlined), label: lCheckoutCart),
      ],
    );
  }
}
