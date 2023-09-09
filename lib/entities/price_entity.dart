import 'entity.dart';

final class PriceEntity extends Entity {
  final double value;

  PriceEntity({
    super.id,
    required super.externalId,
    required this.value,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
