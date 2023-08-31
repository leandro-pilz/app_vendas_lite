import 'package:flutter/material.dart';

import '../utils/constants.dart';

class InkWellCustom extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onTap;

  const InkWellCustom({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusDefault),
      ),
      child: child,
    );
  }
}
