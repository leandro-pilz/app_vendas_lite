import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/entities/customer_entity.dart';
import '/entities/sku_entity.dart';

const String _maskDateTime = "dd/MM/yyyy HH:mm";
const String _maskDate = "dd/MM/yyyy";

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}

extension CustomerToString on CustomerEntity {
  String cpfCnpjFormatted() {
    return cpfCnpj.trim().length == 11 ? UtilBrasilFields.obterCpf(cpfCnpj) : UtilBrasilFields.obterCnpj(cpfCnpj);
  }
}

extension DateFormatters on DateTime {
  String maskDateAndTime() {
    return DateFormat(_maskDateTime).format(this);
  }

  String maskDate() {
    return DateFormat(_maskDate).format(this);
  }
}

extension MoneyFormatter on double {
  String formatCurrency() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$:', decimalDigits: 2).format(this);
  }
}

extension DecimalFormatter on double {
  String decimalFormatter() {
    return NumberFormat("###.00").format(this);
  }
}

extension StrintToDouble on String {
  double convertStringToDouble() {
    return double.tryParse(this) ?? 0.0;
  }
}

extension SkuDisplayItemList on SkuEntity {
  String toCodeAndName() {
    return '$code - $name';
  }
}
