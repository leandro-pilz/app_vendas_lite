import 'entity.dart';
import 'user_entity.dart';

final class PaymentTerm extends Entity {
  final String? code;
  final String name;
  User? user;

  PaymentTerm({
    super.id,
    required super.externalId,
    this.code,
    required this.name,
    required super.status,
    required super.createAt,
    required super.updateAt,
    this.user,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
