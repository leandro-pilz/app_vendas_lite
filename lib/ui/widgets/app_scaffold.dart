import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/widgets/seach_field_appbar.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final bool? usePaddingDefault, useAppBar, useSearchField;
  final Color? bodyBackgroundColor;
  final Function(String value)? onChanged;
  final VoidCallback? onFloatActionButtonPressed;
  final int? currentPageIndex;
  final Function(int index)? onNavigationSelected;
  final List<Widget>? navigationDestination;
  final IconData? iconFloatAction;
  final VoidCallback? onClear;

  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.usePaddingDefault,
    this.useAppBar,
    this.useSearchField,
    this.bodyBackgroundColor,
    this.onChanged,
    this.onFloatActionButtonPressed,
    this.currentPageIndex,
    this.onNavigationSelected,
    this.navigationDestination,
    this.iconFloatAction,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (useAppBar ?? true)
          ? AppBar(
              title: !(useSearchField ?? false)
                  ? Text(title ?? '')
                  : SearchFieldAppBar(
                      onChanged: (value) {
                        if (onChanged != null) {
                          onChanged!(value);
                        }
                      },
                      onClear: () {
                        if (onClear != null) {
                          onClear!();
                        }
                      },
                    ),
            )
          : null,
      body: _body(),
      floatingActionButton: onFloatActionButtonPressed != null
          ? FloatingActionButton(
              onPressed: () => onFloatActionButtonPressed!(),
              child: iconFloatAction != null ? Icon(iconFloatAction) : null,
            )
          : null,
      bottomNavigationBar: (onNavigationSelected != null && currentPageIndex != null)
          ? NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              onDestinationSelected: (int index) {
                onNavigationSelected!(index);
              },
              indicatorColor: Colors.green.shade300,
              selectedIndex: currentPageIndex ?? 0,
              destinations: navigationDestination ?? [],
            )
          : null,
    );
  }

  _body() {
    return Container(
      color: bodyBackgroundColor,
      padding: (usePaddingDefault ?? true) ? const EdgeInsets.all(kSmallPadding) : null,
      child: body,
    );
  }
}
