import 'package:flutter/material.dart';

import '/entities/quotation_item_entity.dart';
import '/ui/data.dart';
import '/ui/utils/constants.dart';
import '/ui/utils/extensions.dart';
import '/ui/utils/infinity_scroll_listener.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/utils/util.dart';
import '/ui/widgets/list_view_custom.dart';
import '/ui/widgets/qantity_field_with_actions.dart';
import '../../../../entities/quotation_entity.dart';

class SearchProductShoppingCartScreen extends StatefulWidget {
  final QuotationEntity quotation;

  const SearchProductShoppingCartScreen({super.key, required this.quotation});

  @override
  State<SearchProductShoppingCartScreen> createState() => _SearchProductShoppingCartScreenState();
}

class _SearchProductShoppingCartScreenState extends State<SearchProductShoppingCartScreen> {
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
      list: skusList,
      scrollController: scrollController,
      child: (index) {
        final sku = skusList[index];

        QuotationItemEntity? item;
        quotation.items.where((element) => element.sku.externalId == sku.externalId).forEach((filter) {
          item = filter;
        });

        return Container(
          width: size.width,
          color: listItemBackgroundColor(index: index),
          padding: const EdgeInsets.symmetric(vertical: kSmallPadding, horizontal: kSmallPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sku.toCodeAndName(),
                style: veryLargeW500Style,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: kSizedBoxSmallSpace),
              Text(
                '$lPrice ${sku.price?.value.formatCurrency()}',
                style: largeW600Style,
              ),
              const SizedBox(height: kSizedBoxSmallSpace),
              QuantityFieldWithActions(
                initialValue: item?.quantity,
                multipleBatch: sku.multipleBatch,
                isSlim: true,
                onChanged: (quantity, addDeleteAction) {
                  // setState(() {
                  final date = DateTime.now();
                  if (item == null) {
                    quotation.items.add(
                      QuotationItemEntity(
                        id: date.millisecondsSinceEpoch,
                        sku: sku,
                        quantity: quantity,
                        value: sku.price!.value,
                        status: true,
                        createAt: date,
                        updateAt: date,
                      ),
                    );

                    addDeleteAction();
                  } else {
                    item?.quantity = quantity;
                    item?.updateAt = date;
                  }
                  // });
                },
                onDelete: (removeDeleteAction) {
                  // setState(() {
                  quotation.items.remove(item);
                  // });

                  removeDeleteAction();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
