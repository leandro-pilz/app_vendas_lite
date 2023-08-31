import 'package:sqflite/sqflite.dart';

void createTableUserV1({required Batch batch}) {
  batch.execute('''
    create table if not exists usuario
    (
        id          integer not null constraint usuario_pk primary key autoincrement,
        nome        text    not null,
        situcao     integer not null,
        criado_em   text    not null,
        alterado_em text    not null
    );
  ''');
}
