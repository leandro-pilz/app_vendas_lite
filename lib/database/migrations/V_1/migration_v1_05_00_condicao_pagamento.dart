import 'package:sqflite/sqflite.dart';

void createTableUserV1_05_00_CondicaoPagamento({required Batch batch}) {
  batch.execute('''
      create table condicao_pagamento
      (
          id                 integer             not null constraint condicao_pagamento_pk primary key autoincrement,
          forma_pagamento_id integer             not null constraint condicao_pagamento_fk_forma_pagamento references forma_pagamento,
          codigo             text,
          nome               text collate NOCASE not null,
          situacao           integer             not null,
          criado_em          text                not null,
          alterado_em        text                not null,
          constraint condicao_pagamento_uk_usuario_forma unique (forma_pagamento_id, nome) on conflict replace, 
          constraint check_status check (situacao in (0, 1))
      );
  ''');
}
