import 'package:sqflite/sqflite.dart';

void createTableUserV1_11_01_ItemCotacaoIndiceCotacao({required Batch batch}) {
  batch.execute(''' create index item_cotacao_idx_cotacao on item_cotacao (cotacao_id); ''');
}
