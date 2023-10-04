import 'package:sqflite/sqflite.dart';

void createTableUserV1_02_01_TokenIndiceUsuario({required Batch batch}) {
  batch.execute(''' create index token_usuario_idx_usuario on token_usuario (usuario_id); ''');
}
