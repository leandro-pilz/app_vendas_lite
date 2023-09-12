import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'ink_well_custom.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;
  final String label;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  const TextFieldCustom({super.key, required this.text, required this.label, this.onTap, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return InkWellCustom(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(kMediumPadding),
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(color: Colors.black87),
          ),
          suffixIcon: suffixIcon,
        ),
        child: Text(text),
      ),
    );
  }
}
