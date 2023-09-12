import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/utils/extensions.dart';
import '/ui/utils/labels.dart';
import '/ui/widgets/filled_button_custom.dart';
import '/ui/widgets/seach_field_page.dart';
import '/ui/widgets/text_field_custom.dart';
import '../../../../entities/quotation_entity.dart';

class CheckoutShoppingCartScreen extends StatefulWidget {
  final QuotationEntity quotation;

  const CheckoutShoppingCartScreen({super.key, required this.quotation});

  @override
  State<CheckoutShoppingCartScreen> createState() => _CheckoutShoppingCartScreenState();
}

class _CheckoutShoppingCartScreenState extends State<CheckoutShoppingCartScreen> {
  late DateTime firstDate;
  late DateTime lastDate;
  late final TextEditingController noteController;

  @override
  void initState() {
    noteController = TextEditingController();
    noteController.text = widget.quotation.note ?? '';
    widget.quotation.deliveryDate ??= DateTime.now();
    firstDate = DateTime.now();
    lastDate = DateTime.now().add(const Duration(days: 30));
    super.initState();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldCustom(
          text: widget.quotation.deliveryDate!.maskDate(),
          label: lDeliveryDate,
          suffixIcon: IconButton(
            onPressed: () => _showCalendar(context),
            icon: const Icon(Icons.calendar_month),
          ),
        ),
        const SizedBox(height: kSizedBoxMediumSpace),
        SearchFieldPage(
          externalController: noteController,
          onChanged: (value) {
            widget.quotation.note = value;
          },
          onClear: () {
            widget.quotation.note = null;
          },
          hint: lNote,
          label: lNote,
          height: kHeightSearchScrollInfinite,
          maxLength: 200,
          maxLines: null,
        ),
        const Spacer(),
        FilledButtonCustom(title: lGenerateOrder, onPressed: () {}),
      ],
    );
  }

  void _showCalendar(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      initialDate: widget.quotation.deliveryDate!,
      firstDate: firstDate,
      lastDate: lastDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (result != null) {
      setState(() {
        widget.quotation.deliveryDate = result;
      });
    }
  }
}
