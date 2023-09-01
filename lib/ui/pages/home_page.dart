import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants.dart';
import '../widgets/app_page_scafold.dart';
import '../widgets/ink_well_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Venda fácil',
      child: _body(context: context),
      usePaddingDefault: false,
    );
  }

  _body({required BuildContext context}) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: kSmallAxisSpacing,
      mainAxisSpacing: kSmallAxisSpacing,
      childAspectRatio: 0.9,
      padding: const EdgeInsets.all(kMediumPadding),
      children: [
        _card(
          title: 'Cotações',
          icon: Icons.shopping_cart,
          onTap: () {
            context.goNamed('cotacao');
          },
        ),
        _card(
          title: 'Clientes',
          icon: Icons.people,
          onTap: () {
            context.goNamed('cliente');
          },
        ),
        _card(
          title: 'Pedidos',
          icon: Icons.attach_money,
          onTap: () {
            context.goNamed('pedido');
          },
        ),
      ],
    );
  }

  _card({required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      child: InkWellCustom(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: kVeryLargeSize,
            ),
            const SizedBox(height: kSizedBoxMediumSpace),
            Text(
              title,
              style: const TextStyle(
                fontSize: kMediumFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
