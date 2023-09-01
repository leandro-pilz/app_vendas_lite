import 'package:app_vendas_lite/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class AppPageScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? usePaddingDefault;

  const AppPageScaffold({super.key, required this.child, this.title, this.usePaddingDefault});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: (usePaddingDefault ?? true)
          ? const EdgeInsets.symmetric(
              horizontal: kMediumPadding,
              vertical: kMediumPadding,
            )
          : null,
      child: child,
    );
  }
}
