import 'package:flutter/material.dart';

import '/ui/data.dart';
import '/ui/utils/constants.dart';
import '/ui/utils/infinity_scroll_listener.dart';
import '/ui/utils/labels.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/utils/util.dart';
import '/ui/widgets/app_scaffold.dart';
import '/ui/widgets/list_view_custom.dart';

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
    return AppScaffold(
      usePaddingDefault: false,
      useSearchField: true,
      body: ListViewCustom(
        isProgress: isProgress,
        list: customers,
        scrollController: scrollController,
        child: (index) {
          return Container(
            width: size.width,
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
