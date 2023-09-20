import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PassWordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? initialValue, errorMessage;
  final TextInputAction? textInputAction;
  final FocusNode? focus;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClearError;
  final bool? prefixIcon, suffixIcon;
  final bool? autofocus;

  const PassWordField({
    super.key,
    required this.controller,
    required this.label,
    this.initialValue,
    this.errorMessage,
    this.textInputAction,
    this.focus,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.onClearError,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus,
  });

  @override
  State<PassWordField> createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  late bool isVisibility;

  @override
  void initState() {
    super.initState();
    isVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      obscureText: !isVisibility,
      autofocus: widget.autofocus ?? false,
      focusNode: widget.focus,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }

        if (value.isNotEmpty && (widget.errorMessage != null && widget.errorMessage!.isNotEmpty)) {
          if (widget.onClearError != null) {
            widget.onClearError!();
          }
        }
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
        prefixIcon: (widget.prefixIcon ?? false) ? const Icon(Icons.lock) : null,
        suffixIcon: IconButton(
          icon: Icon(isVisibility ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              isVisibility = !isVisibility;
            });
          },
        ),
        errorText: widget.errorMessage,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
