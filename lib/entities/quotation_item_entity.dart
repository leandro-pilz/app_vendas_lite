import 'entity.dart';
import 'sku_entity.dart';

final class QuotationItemEntity extends Entity {
  final SkuEntity sku;
  double quantity;
  double value;

  QuotationItemEntity({
    super.id,
    required super.externalId,
    required this.sku,
    required this.quantity,
    required this.value,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }

  double amountItem() {
    return quantity * value;
  }
}
