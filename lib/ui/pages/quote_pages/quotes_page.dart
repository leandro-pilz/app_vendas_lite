import 'package:flutter/material.dart';

import '../../widgets/app_scaffold.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Cotações',
      child: Center(
        child: Text('Cotações'),
      ),
    );
  }
}
