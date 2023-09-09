import 'entity.dart';

final class SkuEntity extends Entity {
  final String code;
  final String name;
  late int multipleBatch;

  SkuEntity({
    super.id,
    required super.externalId,
    required this.code,
    required this.name,
    this.multipleBatch = 1,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
