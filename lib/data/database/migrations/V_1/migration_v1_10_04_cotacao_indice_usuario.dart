import 'package:sqflite/sqflite.dart';

void createTableUserV1_10_04_CotacaoIndiceUsuario({required Batch batch}) {
  batch.execute(''' create index cotacao_idx_usuario on cotacao (usuario_id); ''');
}
