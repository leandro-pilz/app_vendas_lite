import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/widgets/seach_field_appbar.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? title, hint;
  final bool? usePaddingDefault, useAppBar, useSearchField;
  final Color? bodyBackgroundColor;
  final Function(String value)? onChanged;
  final VoidCallback? onFloatActionButtonPressed;
  final int? currentPageIndex;
  final Function(int index)? onNavigationSelected;
  final List<Widget>? navigationDestination;
  final PreferredSizeWidget? bottom;
  final IconData? iconFloatAction;
  final VoidCallback? onClear;

  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.hint,
    this.usePaddingDefault,
    this.useAppBar,
    this.useSearchField,
    this.bodyBackgroundColor,
    this.onChanged,
    this.onFloatActionButtonPressed,
    this.currentPageIndex,
    this.onNavigationSelected,
    this.navigationDestination,
    this.bottom,
    this.iconFloatAction,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: (useAppBar ?? false) ? kLargeElevation : 0.0,
        backgroundColor: !(useAppBar ?? false) ? Colors.white : null,
        title: (useAppBar ?? false)
            ? !(useSearchField ?? false)
                ? Text(title ?? '')
                : SearchFieldAppBar(
                    hint: hint ?? '',
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
                  )
            : null,
        bottom: bottom,
      ),
      body: _body(),
      floatingActionButton: onFloatActionButtonPressed != null
          ? FloatingActionButton(
              onPressed: () => onFloatActionButtonPressed!(),
              child: iconFloatAction != null ? Icon(iconFloatAction) : null,
            )
          : null,
      bottomNavigationBar: (onNavigationSelected != null && currentPageIndex != null)
          ? NavigationBar(
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
      padding: (usePaddingDefault ?? true)
          ? const EdgeInsets.symmetric(
              vertical: kMediumPadding,
              horizontal: kSmallPadding,
            )
          : null,
      child: body,
    );
  }
}
