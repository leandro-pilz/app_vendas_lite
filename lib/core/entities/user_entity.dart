import 'entity.dart';
import 'user_token_entity.dart';

class User extends Entity {
  final String name;
  final String email;
  UserToken? token;

  User({
    super.id,
    required this.name,
    required this.email,
    required super.status,
    required super.createAt,
    required super.updateAt,
    this.token,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
