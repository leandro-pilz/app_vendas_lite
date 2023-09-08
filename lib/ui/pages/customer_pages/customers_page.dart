import 'dart:developer';

import 'package:app_vendas_lite/ui/utils/constants.dart';
import 'package:app_vendas_lite/ui/widgets/list_view_custom.dart';
import 'package:flutter/material.dart';

import '../../data.dart';
import '../../utils/infinity_scroll_listener.dart';
import '../../utils/labels.dart';
import '../../utils/text_style_utils.dart';
import '../../utils/util.dart';
import '../../widgets/app_scaffold.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  late bool isProgress;
  late InfinityScrollListener scrollController;

  @override
  void initState() {
    isProgress = false;
    scrollController = InfinityScrollListener(
      onLoadMore: () {
        log('CARREGAR MAIS INTENS...');
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
    return AppScaffold(
      usePaddingDefault: false,
      useSearchField: true,
      body: ListViewCustom(
        isProgress: isProgress,
        list: customers,
        scrollController: scrollController,
        child: (index) {
          return Container(
            width: double.infinity,
            color: listItemBackgroundColor(index: index),
            padding: const EdgeInsets.symmetric(vertical: kMediumPadding, horizontal: kSmallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customers[index].name,
                  style: largeW600Style,
                ),
                Text('$lCnpj: ${customers[index].cpfCnpj}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
