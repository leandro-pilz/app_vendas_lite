import 'package:sqflite/sqflite.dart';

void createTableUserV1_06_01_SkuIndiceCodProduto({required Batch batch}) {
  batch.execute(''' create index sku_idx_cod_produto on sku (usuario_id, cod_produto); ''');
}
