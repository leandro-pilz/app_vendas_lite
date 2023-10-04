import 'package:flutter/material.dart';

import '../../../core/entities/quotation_entity.dart';
import '/ui/pages/quote_pages/sub_pages/checkout_shopping_cart_screen.dart';
import '/ui/pages/quote_pages/sub_pages/items_shopping_cart_screen.dart';
import '/ui/pages/quote_pages/sub_pages/search_product_shopping_cart_screen.dart';
import '/ui/utils/constants.dart';
import '../../extensions.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/messages.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/widgets/app_scaffold.dart';

class ShoppingCartPage extends StatefulWidget {
  final QuotationEntity quotation;

  const ShoppingCartPage({super.key, required this.quotation});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late int currentPageIndex;
  late List<Widget> views;

  @override
  void initState() {
    currentPageIndex = 0;
    super.initState();
  }

  void _sumQuoteAmount() {
    setState(() {
      widget.quotation.sumAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Carrinho',
      hint: searchProducts,
      useSearchField: currentPageIndex == 0,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: currentPageIndex != 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$lAmount ${widget.quotation.amount.formatCurrency()}',
                  style: veryLargeW600Style,
                ),
                const SizedBox(height: kSizedBoxMediumSpace),
                const Divider(
                  color: Colors.black38,
                  height: 3.0,
                ),
                const SizedBox(height: kSizedBoxMediumSpace),
              ],
            ),
          ),
          Expanded(
            child:

                // IndexedStack(
                //   index: currentPageIndex,
                //   children: [
                //     SearchProductShoppingCartScreen(quotation: widget.quotation, onResetShoppingCart: () => _sumQuoteAmount()),
                //     ItemsShoppingCartScreen(quotation: widget.quotation, onResetShoppingCart: () => _sumQuoteAmount()),
                //     CheckoutShoppingCartScreen(quotation: widget.quotation),
                //   ],
                // )

                <Widget>[
              SearchProductShoppingCartScreen(quotation: widget.quotation, onResetShoppingCart: () => _sumQuoteAmount()),
              ItemsShoppingCartScreen(quotation: widget.quotation, onResetShoppingCart: () => _sumQuoteAmount()),
              CheckoutShoppingCartScreen(quotation: widget.quotation),
            ][currentPageIndex],
          ),
        ],
      ),
      onNavigationSelected: (index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      currentPageIndex: currentPageIndex,
      navigationDestination: <Widget>[
        const NavigationDestination(icon: Icon(Icons.search), label: lProductSearch),
        Stack(
          children: [
            const NavigationDestination(icon: Icon(Icons.shopping_cart), label: lCartProducts),
            Visibility(
              visible: widget.quotation.items.isNotEmpty,
              child: Positioned(
                top: 10.0,
                right: 30.0,
                child: Badge.count(
                  count: widget.quotation.items.length,
                ),
              ),
            ),
          ],
        ),
        const NavigationDestination(icon: Icon(Icons.monetization_on_outlined), label: lCheckoutCart),
      ],
    );
  }
}
