import 'package:sqflite/sqflite.dart';

void createTableUserV1_10_00_Cotacao({required Batch batch}) {
  batch.execute('''
      create table cotacao
      (
          id                    integer not null constraint cotacao_pk primary key autoincrement,
          usuario_id            integer not null constraint cotacao_fk_usuario references usuario,
          cliente_id            integer not null constraint cotacao_fk_cliente references cliente,
          forma_pagamento_id    integer not null constraint cotacao_fk_forma_pagamento references forma_pagamento,
          condicao_pagamento_id integer not null constraint cotacao_fk_condicao_pagamento references condicao_pagamento,
          numero_cotacao        integer not null,
          finalizada            integer not null,
          situacao              integer not null,
          criado_em             text    not null,
          alterado_em           text    not null,
          constraint check_status check (situacao in (0, 1))
      );
  ''');
}
