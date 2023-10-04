import 'package:flutter/material.dart';

import '../../core/extensions.dart';
import '../utils/constants.dart';
import '../utils/debouncer.dart';

const inputTextFormFieldClearTextIconKey = ValueKey('aec54743-c1a4-4ca7-bc18-4152d25d65b5');

class InputTextFormFieldCustom extends StatefulWidget {
  final String label;
  final Function(String value) onChanged;
  final FocusNode? focus;
  final bool? autofocus;
  final String? initialValue, errorMessage;

  const InputTextFormFieldCustom({
    super.key,
    required this.label,
    required this.onChanged,
    this.initialValue,
    this.errorMessage,
    this.autofocus,
    this.focus,
  });

  @override
  State<InputTextFormFieldCustom> createState() => _InputTextFormFieldCustomState();
}

class _InputTextFormFieldCustomState extends State<InputTextFormFieldCustom> {
  late Debouncer debouncer;
  late TextEditingController controller;
  late bool isShowClearIcon;
  late String? initialValue, errorMessage;

  @override
  void initState() {
    debouncer = Debouncer(milliseconds: kMediumDurationMilliSeconds);
    controller = TextEditingController();
    isShowClearIcon = false;
    initialValue = widget.initialValue;
    errorMessage = widget.errorMessage;
    super.initState();
  }

  @override
  void dispose() {
    debouncer.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: kHeightSearchDefault,
      ),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        autofocus: widget.autofocus ?? false,
        focusNode: widget.focus,
        onChanged: (value) {
          debouncer.run(() {
            widget.onChanged(value);
          });

          if (value.trim().isNotEmpty && !isShowClearIcon) {
            setState(() {
              isShowClearIcon = true;
            });
          }

          if (value.trim().isNotEmpty && (widget.errorMessage != null && widget.errorMessage!.isNotEmpty)) {
            setState(() {
              errorMessage = null;
            });
          }
        },
        onTap: () {
          controller.selectAll();
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kMediumPadding),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
          label: Text(widget.label, style: const TextStyle(fontSize: kLargeFontSize, color: Colors.black54)),
          suffixIcon: isShowClearIcon
              ? IconButton(
                  key: inputTextFormFieldClearTextIconKey,
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      isShowClearIcon = !isShowClearIcon;
                      controller.clear();
                    });
                  },
                )
              : null,
          errorText: errorMessage,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
