import 'package:sqflite/sqflite.dart';

void createTableUserV1_06_02_SkuIndiceUsuarioNome({required Batch batch}) {
  batch.execute(''' create index sku_idx_nome on sku (usuario_id, nome); ''');
}
