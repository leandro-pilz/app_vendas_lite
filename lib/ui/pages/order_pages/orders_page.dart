import 'package:app_vendas_lite/ui/widgets/app_page_scafold.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPageScaffold(
      title: 'Pedidos',
      child: Center(
        child: Text('Pedidos'),
      ),
    );
  }
}
