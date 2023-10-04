import 'package:sqflite/sqflite.dart';

void createTableUserV1_11_02_ItemCotacaoIndiceSku({required Batch batch}) {
  batch.execute(''' create index item_cotacao_idx_sku on item_cotacao (sku_id); ''');
}
