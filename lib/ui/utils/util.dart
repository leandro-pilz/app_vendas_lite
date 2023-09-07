import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color listItemBackgroundColor({required int index}) {
  return (index % 2 == 0) ? Colors.white : Colors.grey.shade300;
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}