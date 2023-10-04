import 'package:flutter/material.dart';

import '../../core/extensions.dart';
import 'text_field_custom.dart';

class ShowCalendarCustom extends StatefulWidget {
  final Function(DateTime date) onDateChanged;
  final DateTime? initialDate;
  final String? label;

  const ShowCalendarCustom({super.key, required this.onDateChanged, this.initialDate, this.label});

  @override
  State<ShowCalendarCustom> createState() => _ShowCalendarCustomState();
}

class _ShowCalendarCustomState extends State<ShowCalendarCustom> {
  late DateTime initialDate;
  late DateTime firstDate;
  late DateTime lastDate;

  @override
  void initState() {
    initialDate = widget.initialDate ?? DateTime.now();
    firstDate = DateTime.now();
    lastDate = DateTime.now().add(const Duration(days: 30));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldCustom(
      text: initialDate.maskDate(),
      label: widget.label ?? '',
      suffixIcon: const Icon(Icons.calendar_month),
      onTap: () => _showCalendar(context),
    );
  }

  void _showCalendar(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      selectableDayPredicate: (DateTime value) => value.weekday == DateTime.saturday || value.weekday == DateTime.sunday ? false : true,
    );

    if (result != null) {
      setState(() {
        initialDate = result;
        widget.onDateChanged(initialDate);
      });
    }
  }
}
