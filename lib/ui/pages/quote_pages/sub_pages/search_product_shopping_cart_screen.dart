import 'dart:developer';

import 'package:flutter/material.dart';

import '/ui/data.dart';
import '/ui/utils/constants.dart';
import '../../../../core/extensions.dart';
import '/ui/utils/infinity_scroll_listener.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/utils/util.dart';
import '/ui/widgets/list_view_custom.dart';
import '/ui/widgets/qantity_field_with_actions.dart';
import '../../../../core/entities/quotation_entity.dart';
import '../../../../core/entities/quotation_item_entity.dart';
import '../../app_lifecycle.dart';

class SearchProductShoppingCartScreen extends StatefulWidget {
  final QuotationEntity quotation;
  final VoidCallback onResetShoppingCart;

  const SearchProductShoppingCartScreen({super.key, required this.quotation, required this.onResetShoppingCart});

  @override
  State<SearchProductShoppingCartScreen> createState() => _SearchProductShoppingCartScreenState();
}

class _SearchProductShoppingCartScreenState extends State<SearchProductShoppingCartScreen> implements NotifyLifeCycle {
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
      list: skusList,
      isProgress: isProgress,
      scrollController: scrollController,
      child: (index) {
        final sku = skusList[index];

        QuotationItemEntity? item;
        quotation.items.where((element) => element.id == sku.id).forEach((filter) {
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
                showDeleteAction: item != null,
                onChanged: (quantity, addDeleteAction) {
                  final date = DateTime.now();

                  bool isCreate = true;
                  quotation.items.where((element) => element.id == sku.id).forEach((filter) {
                    filter.quantity = quantity;
                    filter.updateAt = date;
                    isCreate = false;
                  });

                  if (isCreate) {
                    quotation.items.add(
                      QuotationItemEntity(
                        id: sku.id,
                        sku: sku,
                        quantity: quantity,
                        value: sku.price!.value,
                        status: true,
                        createAt: date,
                        updateAt: date,
                      ),
                    );
                  }

                  addDeleteAction();
                  widget.onResetShoppingCart();
                },
                onDelete: (notifyVisibleDeleteAction) {
                  quotation.items.remove(item);
                  notifyVisibleDeleteAction();
                  widget.onResetShoppingCart();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void onShow() {
    log('ON SHOW FOI DISPARADO');
  }
}
