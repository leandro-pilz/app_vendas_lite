import 'package:sqflite/sqflite.dart';

void createTableUserV1_10_03_CotacaoIndiceFormaPagamento({required Batch batch}) {
  batch.execute(''' create index cotacao_idx_forma_pagamento on cotacao (forma_pagamento_id); ''');
}
