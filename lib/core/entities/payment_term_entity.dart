import 'entity.dart';

final class PaymentTermEntity extends Entity {
  final String name;

  PaymentTermEntity({
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
