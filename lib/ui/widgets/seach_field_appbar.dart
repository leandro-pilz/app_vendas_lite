import 'package:flutter/material.dart';

import '/ui/utils/extensions.dart';
import '../utils/constants.dart';
import '../utils/debouncer.dart';

class SearchFieldAppBar extends StatefulWidget {
  final Function(String value) onChanged;
  final VoidCallback onClear;
  final String? hint;

  const SearchFieldAppBar({super.key, required this.onChanged, required this.onClear, this.hint});

  @override
  State<SearchFieldAppBar> createState() => _TextFormCustomState();
}

class _TextFormCustomState extends State<SearchFieldAppBar> {
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
      height: kHeightSearchFieldAppbar,
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
          hintText: widget.hint,
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
