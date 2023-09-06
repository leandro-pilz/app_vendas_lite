import 'entity.dart';

class User extends Entity {
  final String name;

  User({
    super.id,
    required this.name,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });

  @override
  String filter() {
    // TODO: implement filters
    throw UnimplementedError();
  }

  @override
  displaySearchValue() {
    // TODO: implement displaySearchValue
    throw UnimplementedError();
  }
}
