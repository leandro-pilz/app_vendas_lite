import 'package:flutter/material.dart';

import '/ui/utils/util.dart';
import '../utils/auto_complete_data.dart';
import '../utils/constants.dart';
import 'list_view_custom.dart';

class AutoCompleteCustom extends StatefulWidget {
  final Function(Function(List<AutoCompleteData>) onCallBack) onChanged;
  final Function(AutoCompleteData) onSelected;

  const AutoCompleteCustom({super.key, required this.onChanged, required this.onSelected});

  @override
  State<AutoCompleteCustom> createState() => _AutoCompleteCustomState();
}

class _AutoCompleteCustomState extends State<AutoCompleteCustom> {
  late ScrollController scrollController;
  late List<AutoCompleteData> dataList;

  @override
  void initState() {
    dataList = [];
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<AutoCompleteData>(
      optionsBuilder: (TextEditingValue value) {
        if (value.text.isEmpty) {
          return [];
        }

        widget.onChanged((list) {
          setState(() {
            dataList = list;
          });
        });

        return dataList.where((element) => element.filter.toLowerCase().contains(value.text.toLowerCase()));
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return _textFormField(controller: controller, focusNode: focusNode, label: 'Clientes');
      },
      optionsViewBuilder: (BuildContext context, Function onSelect, Iterable<AutoCompleteData> list) {
        return Material(
          child: ListViewCustom(
            list: list.toList(),
            scrollController: scrollController,
            child: (int index) {
              final line = list.elementAt(index);
              return InkWell(
                onTap: () => onSelect(line),
                child: Container(
                  color: listItemBackgroundColor(index: index),
                  child: Text(line.display),
                ),
              );
            },
          ),
        );
      },
      onSelected: (value)  {
        widget.onSelected(value);
      },
      displayStringForOption: (data) => data.display,
    );
  }

  TextFormField _textFormField({required TextEditingController controller, required FocusNode focusNode, required String label}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.black45),
        contentPadding: const EdgeInsets.all(kMediumPadding),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusDefault),
          borderSide: const BorderSide(
            color: Colors.black87,
            // width: 0.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusDefault),
          borderSide: const BorderSide(
            color: Colors.black87,
            // width: 0.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusDefault),
          borderSide: const BorderSide(
            color: Colors.black87,
            // width: 0.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusDefault),
          borderSide: const BorderSide(
            color: Colors.black87,
            // width: 0.0,
          ),
        ),
      ),
    );
  }
}
