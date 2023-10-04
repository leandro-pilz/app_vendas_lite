import 'entity.dart';

class User extends Entity {
  final String name;

  User({
    super.id,
    required super.externalId,
    required this.name,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
