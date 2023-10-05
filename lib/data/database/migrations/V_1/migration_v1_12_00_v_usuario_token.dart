import 'package:sqflite/sqflite.dart';

void createTableUserV1_12_00_VUsuarioToken({required Batch batch}) {
  batch.execute(''' 
    create view v_usuario_token as
    select usuario.id,
           usuario.nome,
           usuario.email,
           usuario.situcao,
           usuario.criado_em,
           usuario.alterado_em,
           token.id as token_id,
           token.access_token,
           token.refresh_token
      from token_usuario token
      join usuario on token.usuario_id = usuario.id;
  ''');
}
