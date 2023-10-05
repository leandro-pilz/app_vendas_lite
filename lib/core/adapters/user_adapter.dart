import '../entities/user_entity.dart';
import '../entities/user_token_entity.dart';

class UserAdapter {
  User mapApiToUser({required Map<String, dynamic> map}) {
    return User(
      id: map['id'],
      name: map['nome'],
      email: map['email'],
      status: map['situacao'],
      createAt: map['criadoEm'],
      updateAt: map['alteradoEm'],
    );
  }

  void mapApiToUserToken({required Map<String, dynamic> map, required User user}) {
    user.token = UserToken(
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }

  Map<String, dynamic> userToSaveMapDb({required User user}) {
    return {
      'id': user.id,
      'nome': user.name,
      'email': user.email,
      'situacao': user.status,
      'criado_em': user.createAt,
      'alterado_em': user.updateAt,
    };
  }

  Map<String, dynamic> userTokenToSaveMapDb({required User user}) {
    return {
      'id': user.token?.id,
      'usuario_id': user.id,
      'access_token': user.token?.accessToken,
      'refresh_token': user.token?.refreshToken,
    };
  }
}
