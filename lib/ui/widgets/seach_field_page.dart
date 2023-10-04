import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/utils/debouncer.dart';
import '../extensions.dart';

class SearchFieldPage extends StatefulWidget {
  final Function(String value) onChanged;
  final VoidCallback onClear;
  final String? hint, label;
  final IconData? prefixIcon;
  final TextEditingController? externalController;
  final FocusNode? focusNode;
  final int? maxLines, maxLength;
  final double? height;

  const SearchFieldPage({
    super.key,
    required this.onChanged,
    required this.onClear,
    this.hint,
    this.label,
    this.prefixIcon,
    this.externalController,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.height,
  });

  @override
  State<SearchFieldPage> createState() => _TextFormCustomState();
}

class _TextFormCustomState extends State<SearchFieldPage> {
  late Debouncer debouncer;
  late TextEditingController controller;
  late bool isShowClearIcon;

  @override
  void initState() {
    debouncer = Debouncer(milliseconds: kMediumDurationMilliSeconds);
    controller = widget.externalController ?? TextEditingController();
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.height ?? kHeightSearchDefault,
      ),
      child: TextFormField(
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        controller: controller,
        focusNode: widget.focusNode,
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
          contentPadding: const EdgeInsets.all(kMediumPadding),
          hintText: widget.hint,
          labelText: widget.label,
          prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: isShowClearIcon
              ? IconButton(
                  onPressed: () {
                    controller.clear();
                    setState(() {
                      isShowClearIcon = false;
                    });

                    widget.onClear();
                  },
                  icon: const Icon(Icons.clear),
                  color: Colors.black87,
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault),
            borderSide: const BorderSide(
              color: Colors.black87,
            ),
          ),
          border: OutlineInputBorder(
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
