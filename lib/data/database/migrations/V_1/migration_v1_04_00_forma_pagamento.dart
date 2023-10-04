import 'package:sqflite/sqflite.dart';

void createTableUserV1_04_00_FormaPagamento({required Batch batch}) {
  batch.execute('''
      create table forma_pagamento
      (
          id          integer             not null constraint forma_pagamento_pk primary key autoincrement,
          usuario_id  integer             not null constraint forma_pagamento_usuario references usuario,
          id_externo  text                not null constraint forma_pagamento_uk_id_externo unique on conflict rollback,
          codigo      text,
          nome        text collate NOCASE not null,
          situacao    integer             not null,
          criado_em   text                not null,
          alterado_em text                not null,
          constraint forma_pagamento_uk_usuario_nome unique (usuario_id, nome),
          constraint check_status check (situacao in (0, 1))
      );
  ''');
}
