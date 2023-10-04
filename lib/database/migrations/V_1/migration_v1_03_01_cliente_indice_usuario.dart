import 'package:sqflite/sqflite.dart';

void createTableUserV1_03_01_ClienteIndexUsuario({required Batch batch}) {
  batch.execute(''' create index cliente_idx_nome on cliente (ususario_id, nome); ''');
}
