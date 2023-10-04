import 'dart:async';

import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '../../core/extensions.dart';

class QuantityFieldWithActions extends StatefulWidget {
  final int multipleBatch;
  final Function(double value, VoidCallback addDeleteAction) onChanged;
  final Function(VoidCallback notifyVisibleDeleteAction) onDelete;
  final double? initialValue;
  final bool? isSlim, showDeleteAction;

  const QuantityFieldWithActions({
    super.key,
    required this.multipleBatch,
    required this.onChanged,
    required this.onDelete,
    this.initialValue,
    this.isSlim,
    this.showDeleteAction,
  });

  @override
  State<QuantityFieldWithActions> createState() => _QuantityFieldWithActionsState();
}

class _QuantityFieldWithActionsState extends State<QuantityFieldWithActions> {
  late TextEditingController controller;
  late int multipleBatch;
  late bool showDeleteAction;
  Timer? timer;

  @override
  void initState() {
    showDeleteAction = widget.showDeleteAction ?? false;
    multipleBatch = widget.multipleBatch;
    assert(multipleBatch > 0);

    controller = TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!.toInt().toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.isSlim ?? false) ? 40.0 : 48.0,
      child: Row(
        children: [
          Card(
            elevation: kSmallElevation,
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(kBorderRadiusDefault),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                maxLines: 1,
                maxLength: 6,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: kSmallPadding),
                  prefixIcon: _button(text: '-$multipleBatch', isIncrement: false, isPrefixButton: true),
                  suffixIcon: _button(text: '+$multipleBatch', isIncrement: true, isPrefixButton: false),
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                onTap: () {
                  controller.selectAll();
                },
                onChanged: (value) {
                  _run(kMediumDurationMilliSeconds, () {
                    var value = controller.text.convertStringToDouble();
                    if (value == 0) {
                      value = multipleBatch.toDouble();
                    } else if (value % multipleBatch > 0) {
                      value = (((value / multipleBatch).ceil()) * multipleBatch).toDouble();
                    }

                    controller.text = value.toInt().toString();
                    widget.onChanged(value.toDouble(), () {
                      if (!showDeleteAction) {
                        setState(() {
                          showDeleteAction = true;
                        });
                      }
                    });
                  });
                },
              ),
            ),
          ),
          if (showDeleteAction) const SizedBox(width: kSizedBoxSmallSpace),
          showDeleteAction
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: kSmallElevation,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    widget.onDelete(() {
                      timer?.cancel();
                      setState(() {
                        showDeleteAction = false;
                        controller.clear();
                      });
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _button({required String text, required bool isIncrement, required bool isPrefixButton}) {
    return FilledButton(
      onPressed: () {
        var value = controller.text.convertStringToDouble();
        if (!isIncrement && value == 0) {
          return;
        }

        if (value % multipleBatch > 0) {
          if (isIncrement) {
            value = (((value / multipleBatch).ceil()) * multipleBatch).toDouble();
          } else {
            value = (((value - multipleBatch).toInt() / multipleBatch).ceil() * multipleBatch).toDouble();
          }
        } else {
          isIncrement ? value += multipleBatch : value -= multipleBatch;
        }

        value = value > 0 ? value : multipleBatch.toDouble();
        controller.text = value.toInt().toString();

        _run(kVeryFastDurationMilliSeconds, () {
          widget.onChanged(value.toDouble(), () {
            if (!showDeleteAction) {
              setState(() {
                showDeleteAction = true;
              });
            }
          });
        });
      },
      style: FilledButton.styleFrom(
        elevation: 3.0,
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: isPrefixButton ? const Radius.circular(kBorderRadiusDefault) : Radius.zero,
            bottomLeft: isPrefixButton ? const Radius.circular(kBorderRadiusDefault) : Radius.zero,
            topRight: isPrefixButton ? Radius.zero : const Radius.circular(kBorderRadiusDefault),
            bottomRight: isPrefixButton ? Radius.zero : const Radius.circular(kBorderRadiusDefault),
          ),
        ),
      ),
      child: Text(text),
    );
  }

  void _run(int milliseconds, VoidCallback action) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
