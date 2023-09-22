import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/text_style_utils.dart';
import 'circular_progress_indicator_custom.dart';

class FilledButtonCustom extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;

  const FilledButtonCustom({super.key, required this.title, required this.onPressed, this.isLoading});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: kHeightButtonDefault,
      width: size.width / 2.0,
      child: FilledButton(
        style: FilledButton.styleFrom(
          textStyle: largeW500Style,
        ),
        onPressed: !(isLoading ?? false) ? onPressed : null,
        child: !(isLoading ?? false) ? Text(title) : const CircularProgressIndicatorCustom(),
      ),
    );
  }
}
