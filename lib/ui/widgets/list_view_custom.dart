import 'package:flutter/material.dart';

import '/entities/entity.dart';
import '/ui/utils/constants.dart';
import 'circular_progress_indicator_custom.dart';

class ListViewCustom extends StatelessWidget {
  final List<dynamic> list;
  final ScrollController scrollController;
  final Widget Function(int index) child;
  final bool? shrinkWrap;
  final bool? isProgress;

  const ListViewCustom({
    super.key,
    required this.list,
    required this.scrollController,
    required this.child,
    this.shrinkWrap,
    this.isProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black87,
                style: BorderStyle.solid,
                // width: 1.0,
              ),
            ),
            child: ListView.builder(
              controller: scrollController,
              shrinkWrap: shrinkWrap ?? false,
              itemCount: list.length,
              itemBuilder: (_, index) {
                return child(index);
              },
            ),
          ),
          (isProgress ?? false)
              ? Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: kLargeMargin),
                  child: const CircularProgressIndicatorCustom(),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
