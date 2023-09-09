import 'entity.dart';

final class StockEntity extends Entity {
  final double quantity;

  StockEntity({
    super.id,
    required super.externalId,
    required this.quantity,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
