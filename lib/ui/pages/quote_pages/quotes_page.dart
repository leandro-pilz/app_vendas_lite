import 'package:flutter/material.dart';

import '../../widgets/app_page_scafold.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPageScaffold(
      title: 'Cotações',
      child: Center(
        child: Text('Cotações'),
      ),
    );
  }
}
