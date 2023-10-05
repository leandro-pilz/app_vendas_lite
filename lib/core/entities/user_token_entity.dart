import 'entity.dart';

class UserToken extends Entity {
  final String accessToken;
  final String refreshToken;

  UserToken({
    super.id,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
