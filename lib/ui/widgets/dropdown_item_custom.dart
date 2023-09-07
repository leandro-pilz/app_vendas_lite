import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/text_style_utils.dart';

class DropDownItemCustom extends StatelessWidget {
  final String title;
  final String? subTitle;

  const DropDownItemCustom({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kSmallPadding),
      height: kHeightLineListViewDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: mediumW500Style),
          if (subTitle != null) Text(subTitle!),
        ],
      ),
    );
  }
}
