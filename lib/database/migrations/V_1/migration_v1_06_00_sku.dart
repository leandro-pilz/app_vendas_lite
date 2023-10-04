import 'package:sqflite/sqflite.dart';

void createTableUserV1_06_00_Sku({required Batch batch}) {
  batch.execute('''
      create table sku
      (
          id          integer             not null constraint sku_pk primary key autoincrement,
          usuario_id  integer             not null constraint produto_fk_usuario references usuario,
          cod_produto text                not null,
          cod_sku     text                not null,
          nome        text collate NOCASE not null,
          situacao    integer             not null,
          criado_em   text                not null,
          alterado_em text                not null,
          constraint sku_uk_codigo unique (usuario_id, cod_sku) on conflict replace,
          constraint check_status check (situacao in (0, 1))
      );
  ''');
}
