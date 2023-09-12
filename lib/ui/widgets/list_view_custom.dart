import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/utils/messages.dart';
import '/ui/utils/text_style_utils.dart';
import 'circular_progress_indicator_custom.dart';

class ListViewCustom extends StatelessWidget {
  final List<dynamic> list;
  final ScrollController scrollController;
  final Widget Function(int index) child;
  final bool? shrinkWrap, isProgress, enableBorder, useBottomSpace;
  final String? textNotFoundData;

  const ListViewCustom({
    super.key,
    required this.list,
    required this.scrollController,
    required this.child,
    this.shrinkWrap,
    this.isProgress,
    this.enableBorder,
    this.useBottomSpace,
    this.textNotFoundData,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: Stack(
        children: [
          Container(
            decoration: (enableBorder ?? false)
                ? BoxDecoration(
                    border: Border.all(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                      // width: 1.0,
                    ),
                  )
                : null,
            child: ListView.builder(
              key: super.key,
              padding: (useBottomSpace ?? false) ? const EdgeInsets.only(bottom: kHeightBottomListView) : null,
              controller: scrollController,
              shrinkWrap: shrinkWrap ?? false,
              itemCount: list.length,
              itemBuilder: (_, index) => child(index),
            ),
          ),
          if (list.isEmpty && !(isProgress ?? false))
            Center(
              child: Text(
                textNotFoundData ?? noDataFound,
                style: largeW500Style,
              ),
            ),
          if (list.isNotEmpty && (isProgress ?? false))
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: kLargeMargin),
              child: const CircularProgressIndicatorCustom(),
            ),
        ],
      ),
    );
  }
}
