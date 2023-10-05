import '../entities/user_entity.dart';
import '../entities/user_token_entity.dart';

base class UserTokenViewDbAdapter {
  User mapApiToUserToken({required Map<String, dynamic> map}) {
    return User(
      id: map['usuario.id'],
      name: map['usuario.nome'],
      email: map['usuario.email'],
      status: map['usuario.situcao'],
      createAt: map['usuario.criado_em'],
      updateAt: map['usuario.alterado_em'],
      token: UserToken(
        id: map['token.id as token_id'],
        accessToken: map['token.access_token'],
        refreshToken: map['token.refresh_token'],
      ),
    );
  }
}
