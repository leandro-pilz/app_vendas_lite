import 'package:app_vendas_lite/entities/customer_entity.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

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
