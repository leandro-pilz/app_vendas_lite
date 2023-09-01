import 'package:app_vendas_lite/entities/user_entity.dart';

class UsuarioAdapter {
  static User mapParaEntidade({required Map<String, dynamic> map}) {
    return User(
      id: map['id'],
      name: map['nome'],
      status: map['situacao'],
      createAt: map['criado_em'],
      updateAt: map['alterado_em'],
    );
  }

  static Map<String, dynamic> entidadeParaMap({required User usuario}) {
    return {
      'id': usuario.id,
      'nome': usuario.name,
      'situacao': usuario.status,
      'criado_em': usuario.createAt,
      'alterado_em': usuario.updateAt,
    };
  }

  static List<Map<String, dynamic>> entidadesParaMap({required List<User> usuarios}) {
    return usuarios.map((e) => entidadeParaMap(usuario: e)).toList();
  }
}
