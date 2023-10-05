import 'entity.dart';
import 'payment_term_entity.dart';
import 'user_entity.dart';

final class FormPayment extends Entity {
  final String? code;
  final String name;
  User? user;
  final List<PaymentTerm> paymentTerms;

  FormPayment({
    super.id,
    required super.externalId,
    this.code,
    required this.name,
    required super.status,
    required super.createAt,
    required super.updateAt,
    this.user,
    required this.paymentTerms,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
