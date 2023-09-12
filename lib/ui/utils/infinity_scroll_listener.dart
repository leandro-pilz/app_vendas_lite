import 'package:flutter/widgets.dart';

class InfinityScrollListener extends ScrollController {
  final VoidCallback onLoadMore;
  final Function(double offset) onOffSetListener;

  InfinityScrollListener({required this.onOffSetListener, required this.onLoadMore}) {
    addListener(_endListener);
    addListener(_offSetListener);
  }

  void _endListener() {
    if (position.pixels == position.maxScrollExtent) {
      onLoadMore.call();
    }
  }

  void _offSetListener() {
    onOffSetListener.call(offset);
  }

  @override
  void dispose() {
    removeListener(_endListener);
    removeListener(_offSetListener);
    super.dispose();
  }
}
