import 'dart:async';

import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/utils/extensions.dart';

class QuantityFieldWithActions extends StatefulWidget {
  final int multipleBatch;
  final Function(double value) onChanged;
  final int? initialValue;
  final bool? isSlim;
  final int? postChangeExecuteMilliSeconds;

  const QuantityFieldWithActions({
    super.key,
    required this.multipleBatch,
    required this.onChanged,
    this.initialValue,
    this.isSlim,
    this.postChangeExecuteMilliSeconds,
  });

  @override
  State<QuantityFieldWithActions> createState() => _QuantityFieldWithActionsState();
}

class _QuantityFieldWithActionsState extends State<QuantityFieldWithActions> {
  late TextEditingController controller;
  late int multipleBatch, milliseconds;
  Timer? timer;

  @override
  void initState() {
    multipleBatch = widget.multipleBatch;
    milliseconds = widget.postChangeExecuteMilliSeconds ?? kMediumDurationMilliSeconds;
    assert(multipleBatch > 0);

    controller = TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!.toString();
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
    return Container(
      width: 200.0,
      height: (widget.isSlim ?? false) ? 32.0 : 48.0,
      decoration: BoxDecoration(
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
          _run(() {
            var value = controller.text.convertStringToInt();
            if (value == 0) {
              value = multipleBatch;
            } else if (value % multipleBatch > 0) {
              value = ((value / multipleBatch).ceil()) * multipleBatch;
            }

            controller.text = value.toString();
            widget.onChanged(value.toDouble());
          });
        },
      ),
    );
  }

  Widget _button({required String text, required bool isIncrement, required bool isPrefixButton}) {
    return FilledButton(
      onPressed: () {
        var value = controller.text.convertStringToInt();
        if (!isIncrement && value == 0) {
          return;
        }

        if (value % multipleBatch > 0) {
          if (isIncrement) {
            value = ((value / multipleBatch).ceil()) * multipleBatch;
          } else {
            value = ((value - multipleBatch).toInt() / multipleBatch).ceil() * multipleBatch;
          }
        } else {
          isIncrement ? value += multipleBatch : value -= multipleBatch;
        }

        value = value > 0 ? value : multipleBatch;
        controller.text = value.toString();
        widget.onChanged(value.toDouble());
      },
      style: FilledButton.styleFrom(
        backgroundColor: Colors.blue,
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

  void _run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
