import 'package:sqflite/sqflite.dart';

void createTableUserV1_05_01_CondicaoPagamentoIndiceFormaPagamento({required Batch batch}) {
  batch.execute(''' create index condicao_pagamento_idx_sku on condicao_pagamento (forma_pagamento_id); ''');
}
