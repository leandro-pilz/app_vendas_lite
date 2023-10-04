import 'package:sqflite/sqflite.dart';

void createTableUserV1_07_00_Preco({required Batch batch}) {
  batch.execute('''
      create table preco
      (
          id          integer not null constraint preco_pk primary key autoincrement,
          sku_id      integer not null constraint preco_uk_sku unique constraint preco_fk_sku references sku,
          preco       real    not null,
          criado_em   TEXT    not null,
          alterado_em text    not null
      );
  ''');
}
