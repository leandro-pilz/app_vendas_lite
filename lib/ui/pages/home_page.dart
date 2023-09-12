import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants.dart';
import '../utils/routes_name_app.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/ink_well_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '',
      // title: 'Venda fácil',
      body: _body(context: context),
      usePaddingDefault: false,
    );
  }

  _body({required BuildContext context}) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: kSmallAxisSpacing,
      mainAxisSpacing: kSmallAxisSpacing,
      childAspectRatio: 1.1,
      padding: const EdgeInsets.all(kMediumPadding),
      children: [
        _card(
          title: 'Cotações',
          icon: Icons.shopping_cart,
          onTap: () {
            context.goNamed(quotationRouteName);
          },
        ),
        _card(
          title: 'Clientes',
          icon: Icons.people,
          onTap: () {
            context.goNamed(customerRouteName);
          },
        ),
        _card(
          title: 'Pedidos',
          icon: Icons.attach_money,
          onTap: () {
            context.goNamed(orderRouteName);
          },
        ),
      ],
    );
  }

  _card({required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      color: Colors.grey.shade300,
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
