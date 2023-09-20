import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/text_style_utils.dart';

class FilledButtonCustom extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const FilledButtonCustom({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: kHeightButtonDefault,
      width: size.width,
      child: FilledButton(
        style: FilledButton.styleFrom(
          textStyle: largeW500Style,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
