import '../entities/user_entity.dart';

class UsuarioAdapter {
  static User mapParaEntidade({required Map<String, dynamic> map}) {
    return User(
      externalId: map['id'],
      name: map['nome'],
      status: map['situacao'],
      createAt: map['criado_em'],
      updateAt: map['alterado_em'],
    );
  }

  static Map<String, dynamic> entidadeParaMap({required User usuario}) {
    return {
      'externalId': usuario.externalId,
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
