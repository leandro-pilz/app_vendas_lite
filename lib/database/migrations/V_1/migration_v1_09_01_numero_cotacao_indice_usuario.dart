import 'package:sqflite/sqflite.dart';

void createTableUserV1_09_01_NumeroCotacaoIndiceCotacao({required Batch batch}) {
  batch.execute(''' create index numero_cotacao_idx_usuario on numero_cotacao (usuario_id); ''');
}
