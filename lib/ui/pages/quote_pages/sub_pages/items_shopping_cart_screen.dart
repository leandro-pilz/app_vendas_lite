import 'package:flutter/material.dart';

import '/ui/data.dart';
import '/ui/utils/constants.dart';
import '/ui/utils/extensions.dart';
import '/ui/utils/infinity_scroll_listener.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/utils/util.dart';
import '/ui/widgets/list_view_custom.dart';

class ItemsShoppingCartScreen extends StatefulWidget {
  const ItemsShoppingCartScreen({super.key});

  @override
  State<ItemsShoppingCartScreen> createState() => _ItemsShoppingCartScreenState();
}

class _ItemsShoppingCartScreenState extends State<ItemsShoppingCartScreen> {
  late bool isProgress;
  late InfinityScrollListener scrollController;

  @override
  void initState() {
    isProgress = false;
    scrollController = InfinityScrollListener(
      onLoadMore: () {
        setState(() {
          isProgress = true;
          _timeLoad();
        });
      },
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
    quotations.first.sumAmount();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$lAmount ${quotations.first.amount.formatCurrency()}',
          style: veryLargeW600Style,
        ),
        const SizedBox(height: kSizedBoxMediumSpace),
        Expanded(
          child: ListViewCustom(
            list: quotations.first.items,
            scrollController: scrollController,
            child: (index) {
              final item = quotations.first.items[index];
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
                        Text('$lValue ${item.value.formatCurrency()}'),
                        SizedBox(
                          width: 150.0,
                          child: Text(
                            '$lQty: ${item.quantity.decimalFormatter()}',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$lAmount ${item.amountItem().formatCurrency()}',
                      style: mediumW600Style,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
