import 'package:app_vendas_lite/entities/entity.dart';
import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {
  final List<Entity> list;
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
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: shrinkWrap ?? false,
        itemCount: list.length,
        itemBuilder: (_, index) {
          return Stack(
            children: [
              child(index),
              (isProgress ?? false)
                  ? Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        strokeWidth: 3.0,
                        color: Colors.blue,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}
