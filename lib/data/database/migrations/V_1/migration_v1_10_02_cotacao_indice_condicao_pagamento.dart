import 'package:sqflite/sqflite.dart';

void createTableUserV1_10_02_CotacaoIndiceCondicaoPagamento({required Batch batch}) {
  batch.execute(''' create index cotacao_idx_condicao_pagamento on cotacao (condicao_pagamento_id); ''');
}
