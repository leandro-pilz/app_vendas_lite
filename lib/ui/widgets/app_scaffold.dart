import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? usePaddingDefault, useAppBar;
  final Color? bodyBackgroundColor;

  const AppScaffold({
    super.key,
    required this.child,
    this.title,
    this.usePaddingDefault,
    this.useAppBar,
    this.bodyBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (useAppBar ?? true)
          ? AppBar(
              title: title != null ? Text(title!) : null,
            )
          : null,
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: bodyBackgroundColor,
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
