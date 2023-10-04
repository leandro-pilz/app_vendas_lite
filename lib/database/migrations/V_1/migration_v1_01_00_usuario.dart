import 'package:sqflite/sqflite.dart';

void createTableUserV1_01_00_Usuario({required Batch batch}) {
  batch.execute('''
      create table usuario
      (
          id          integer not null constraint usuario_pk primary key autoincrement,
          nome        text    not null,
          email       text    not null constraint usuario_uk_email unique on conflict replace,
          situcao     integer not null,
          criado_em   text    not null,
          alterado_em text    not null,
          constraint check_status check (situcao in (0, 1))
      );
  ''');
}
