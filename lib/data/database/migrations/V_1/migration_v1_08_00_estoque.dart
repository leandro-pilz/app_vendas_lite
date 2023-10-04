import 'package:sqflite/sqflite.dart';

void createTableUserV1_08_00_Estoque({required Batch batch}) {
  batch.execute('''
      create table estoque
      (
          id          integer not null constraint estoque_pk primary key autoincrement,
          sku_id      integer not null constraint estoque_uk_sku unique constraint estoque_fk_sku references sku,
          quantidade  real    not null,
          criado_em   text    not null,
          alterado_em text    not null
      );
  ''');
}
