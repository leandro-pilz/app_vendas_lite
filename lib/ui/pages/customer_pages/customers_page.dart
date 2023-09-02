import 'dart:developer';

import 'package:app_vendas_lite/entities/customer_entity.dart';
import 'package:app_vendas_lite/ui/utils/constants.dart';
import 'package:app_vendas_lite/ui/widgets/list_view_custom.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/infinity_scroll_listener.dart';
import '../../utils/util.dart';
import '../../widgets/app_scaffold.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _customers = <CustomerEntity>[
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
      CustomerEntity(
        name: 'cliente abc',
        cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
        status: true,
        createAt: '00/00/0000 00:00',
        updateAt: '00/00/0000 00:00',
      ),
    ];

    final InfinityScrollListener scrollController = InfinityScrollListener(
      onLoadMore: () {
        log('CARREGAR MAIS INTENS...');
      },
    );

    return AppScaffold(
      title: 'Clientes',
      usePaddingDefault: false,
      child: ListViewCustom(
        list: _customers,
        scrollController: scrollController,
        child: (index) {
          return Container(
            width: double.infinity,
            color: listItemBackgroundColor(index: index),
            padding: const EdgeInsets.symmetric(vertical: kMediumPadding, horizontal: kSmallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_customers[index].name),
                Text(_customers[index].cpfCnpj),
                TextButton(onPressed: (){
                  context.goNamed('cotacao');
                }, child: Text('clique')),
              ],
            ),
          );
        },
      ),
    );
  }
}
