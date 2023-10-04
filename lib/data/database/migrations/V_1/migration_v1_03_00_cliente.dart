import 'package:sqflite/sqflite.dart';

void createTableUserV1_03_00_Cliente({required Batch batch}) {
  batch.execute('''
      create table cliente
      (
          id          integer             not null constraint cliente_pk primary key autoincrement,
          ususario_id integer             not null constraint cliente_fk_usuario references usuario,
          id_externo  text                not null constraint cliente_uk_id_externo unique on conflict rollback,
          cpf_cnpj    text                not null,
          nome        text collate NOCASE not null,
          email       text,
          telefone    text,
          situacao    integer             not null,
          criado_em   text                not null,
          alterado_em text                not null,
          constraint cliente_uk_cpf_cnpj unique (ususario_id, cpf_cnpj) on conflict replace,
          constraint check_status check (situacao in (0, 1))
      );
  ''');
}
