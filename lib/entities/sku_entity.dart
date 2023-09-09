import 'entity.dart';
import 'price_entity.dart';
import 'stock_entity.dart';

final class SkuEntity extends Entity {
  final String productId;
  final String code;
  final String name;
  late int multipleBatch;
  PriceEntity? price;
  StockEntity? stock;

  SkuEntity({
    super.id,
    required super.externalId,
    required this.productId,
    required this.code,
    required this.name,
    this.multipleBatch = 1,
    required super.status,
    required super.createAt,
    required super.updateAt,
    this.price,
    this.stock,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
