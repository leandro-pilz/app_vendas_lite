import 'package:sqflite/sqflite.dart';

void createTableUserV1_10_01_CotacaoIndiceCliente({required Batch batch}) {
  batch.execute(''' create index cotacao_idx_cliente on cotacao (cliente_id); ''');
}
