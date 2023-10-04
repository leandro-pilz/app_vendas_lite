import 'package:sqflite/sqflite.dart';

void createTableUserV1_09_00_NumeroCotacao({required Batch batch}) {
  batch.execute('''
      create table numero_cotacao
      (
          id          integer not null constraint numero_cotacao_pk primary key autoincrement,
          usuario_id  integer not null constraint numero_cotacao_fk_usuario references usuario,
          numero      integer not null,
          criado_em   text    not null,
          alterado_em text    not null
      );
  ''');
}
