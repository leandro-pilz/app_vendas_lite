import 'package:flutter/material.dart';

import '/ui/utils/extensions.dart';
import '../utils/constants.dart';
import '../utils/debouncer.dart';

class SearchFieldCustom extends StatefulWidget {
  final Function(String value) onChanged;
  final VoidCallback onClear;

  const SearchFieldCustom({super.key, required this.onChanged, required this.onClear});

  @override
  State<SearchFieldCustom> createState() => _TextFormCustomState();
}

class _TextFormCustomState extends State<SearchFieldCustom> {
  late Debouncer debouncer;
  late TextEditingController controller;
  late bool isShowClearIcon;

  @override
  void initState() {
    debouncer = Debouncer(milliseconds: kMediumDurationMilliSeconds);
    controller = TextEditingController();
    isShowClearIcon = false;
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
    return SizedBox(
      height: kHeightSearchField,
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.characters,
        onChanged: (value) {
          debouncer.run(() {
            widget.onChanged(value);
          });

          if (value.trim().isNotEmpty && !isShowClearIcon) {
            setState(() {
              isShowClearIcon = true;
            });
          }
        },
        onTap: () {
          controller.selectAll();
        },
        decoration: InputDecoration(
          hintText: 'Pesquisar clientes...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: isShowClearIcon
              ? IconButton(
                  onPressed: () {
                    controller.clear();
                    setState(() {
                      isShowClearIcon = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                  color: Colors.black87,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
