import 'package:app_vendas_lite/entidades/usuario.dart';

class UsuarioAdapter {
  static Usuario mapParaEntidade({required Map<String, dynamic> map}) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      situacao: map['situacao'],
      createAt: map['criado_em'],
      updateAt: map['alterado_em'],
    );
  }

  static Map<String, dynamic> entidadeParaMap({required Usuario usuario}) {
    return {
      'id': usuario.id,
      'nome': usuario.nome,
      'situacao': usuario.situacao,
      'criado_em': usuario.createAt,
      'alterado_em': usuario.updateAt,
    };
  }

  static List<Map<String, dynamic>> entidadesParaMap({required List<Usuario> usuarios}) {
    return usuarios.map((e) => entidadeParaMap(usuario: e)).toList();
  }
}
