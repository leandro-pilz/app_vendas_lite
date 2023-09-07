import 'entity.dart';
import 'payment_term_entity.dart';

final class FormPaymentEntity extends Entity {
  final String name;
  final List<PaymentTermEntity> paymentTerms;

  FormPaymentEntity({
    super.id,
    required super.externalId,
    required this.name,
    required super.status,
    required super.createAt,
    required super.updateAt,
    required this.paymentTerms,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
