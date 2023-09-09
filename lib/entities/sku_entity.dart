import 'entity.dart';

final class SkuEntity extends Entity {
  final String code;
  final String name;

  SkuEntity({
    super.id,
    required super.externalId,
    required this.code,
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
