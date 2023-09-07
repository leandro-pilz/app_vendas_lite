import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/widgets/dropdown_item_custom.dart';
import '../utils/dropdown_data.dart';

class DropDownCustom extends StatelessWidget {
  final String initialItem;
  final List<DropDownData> list;
  final Function(String id) onChanged;
  final String? label;

  const DropDownCustom({
    super.key,
    required this.initialItem,
    required this.list,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeightLineListViewDefault,
      child: DropdownButtonFormField<String>(
        value: initialItem,
        items: list
            .map(
              (e) => DropdownMenuItem<String>(
                value: e.id,
                child: DropDownItemCustom(
                  title: e.title,
                  subTitle: e.subTitle,
                ),
              ),
            )
            .toList(),
        onChanged: (id) {
          if (initialItem != id) {
            onChanged(id!);
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(kMediumPadding),
          labelText: label ?? '',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
