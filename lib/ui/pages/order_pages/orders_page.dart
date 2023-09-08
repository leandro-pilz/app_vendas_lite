import 'package:app_vendas_lite/ui/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Pedidos',
      body: Center(
        child: Text('Pedidos'),
      ),
    );
  }
}
