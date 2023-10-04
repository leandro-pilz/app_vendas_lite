import 'package:sqflite/sqflite.dart';

void createTableUserV1_02_00_TokenUsuario({required Batch batch}) {
  batch.execute('''
      create table token_usuario
      (
          id            integer not null constraint token_usuario_pk primary key autoincrement,
          usuario_id    integer not null constraint token_usuario_fk_usuario references usuario,
          access_token  text    not null,
          refresh_token text    not null
      );
  ''');
}
