import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/utils/extensions.dart';
import '/ui/utils/infinity_scroll_listener.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/utils/util.dart';
import '/ui/widgets/list_view_custom.dart';
import '/ui/widgets/qantity_field_with_actions.dart';
import '../../../../entities/quotation_entity.dart';

class ItemsShoppingCartScreen extends StatefulWidget {
  final QuotationEntity quotation;
  final VoidCallback onResetShoppingCart;

  const ItemsShoppingCartScreen({super.key, required this.quotation, required this.onResetShoppingCart});

  @override
  State<ItemsShoppingCartScreen> createState() => _ItemsShoppingCartScreenState();
}

class _ItemsShoppingCartScreenState extends State<ItemsShoppingCartScreen> {
  late bool isProgress;
  late InfinityScrollListener scrollController;
  late QuotationEntity quotation;

  @override
  void initState() {
    quotation = widget.quotation;
    isProgress = false;
    scrollController = InfinityScrollListener(
      onLoadMore: () {
        setState(() {
          isProgress = true;
          _timeLoad();
        });
      },
      onOffSetListener: (offSet) {},
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  _timeLoad() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListViewCustom(
      list: quotation.items,
      scrollController: scrollController,
      child: (index) {
        final item = quotation.items[index];
        return Container(
          width: size.width,
          color: listItemBackgroundColor(index: index),
          padding: const EdgeInsets.symmetric(vertical: kSmallPadding, horizontal: kSmallPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.sku.toCodeAndName(),
                style: largeW600Style,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: kSizedBoxSmallSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$lPrice ${item.value.formatCurrency()}'),
                  SizedBox(
                    width: 180.0,
                    child: Text('$lAmount ${item.amountItem().formatCurrency()}', style: mediumW600Style),
                  ),
                ],
              ),
              const SizedBox(height: kSizedBoxSmallSpace),
              QuantityFieldWithActions(
                initialValue: item.quantity,
                multipleBatch: item.sku.multipleBatch,
                showDeleteAction: true,
                isSlim: true,
                onChanged: (value, addDeleteAction) {
                  setState(() {
                    item.quantity = value;
                    widget.onResetShoppingCart();
                  });
                },
                onDelete: (notifyVisibleDeleteAction) {
                  setState(() {
                    quotation.items.remove(item);
                    widget.onResetShoppingCart();
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
