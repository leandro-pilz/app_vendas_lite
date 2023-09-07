import 'package:flutter/material.dart';

import '/ui/utils/util.dart';
import '/ui/widgets/seach_field_page.dart';
import '../utils/auto_complete_data.dart';
import '../utils/constants.dart';
import '../utils/labels.dart';
import '../utils/messages.dart';
import '../utils/text_style_utils.dart';
import 'list_view_custom.dart';

class AutoCompleteCustom extends StatefulWidget {
  final Function(Function(Future<List<AutoCompleteData>>) onCallBack) onChanged;
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

        widget.onChanged((list) async {
          dataList = await list;
        });

        return dataList.where((element) => element.filter.toLowerCase().contains(value.text.toLowerCase()));
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return SearchFieldPage(
          externalController: controller,
          focusNode: focusNode,
          onChanged: (value) {},
          onClear: () => controller.clear(),
          hint: searchCustomers,
          label: lCustomers,
        );
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
                  padding: const EdgeInsets.symmetric(horizontal: kSmallPadding),
                  alignment: Alignment.centerLeft,
                  height: kHeightLineListViewDefault,
                  color: listItemBackgroundColor(index: index),
                  child: line.subTitle != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(line.title, style: mediumW500Style),
                            Text(line.subTitle ?? '-'),
                          ],
                        )
                      : Text(line.title, style: mediumW500Style),
                ),
              );
            },
          ),
        );
      },
      onSelected: (value) {
        widget.onSelected(value);
      },
      displayStringForOption: (data) => data.title,
    );
  }
}
