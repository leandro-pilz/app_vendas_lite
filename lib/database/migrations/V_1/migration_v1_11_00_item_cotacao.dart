import 'package:sqflite/sqflite.dart';

void createTableUserV1_11_00_ItemCotacao({required Batch batch}) {
  batch.execute('''
      create table item_cotacao
      (
          id               integer not null constraint item_cotacao_pk primary key autoincrement,
          cotacao_id       integer not null constraint item_cotacao_fk_cotacao references cotacao,
          sku_id           integer not null constraint item_cotacao_fk_sku references sku,
          quantidade       real    not null,
          valor            real    not null,
          valor_gerenciado real    not null,
          criado_em        text    not null,
          alterado_em      text    not null
      );
  ''');
}
