import '/entities/entity.dart';
import 'customer_entity.dart';
import 'form_payment_entity.dart';
import 'payment_term_entity.dart';

final class QuotationEntity extends Entity {
  final String quotationNumber;
  final CustomerEntity customer;
  FormPaymentEntity? formPayment;
  PaymentTermEntity? paymentTerm;

  QuotationEntity({
    super.id,
    required super.externalId,
    required this.quotationNumber,
    required this.customer,
    this.formPayment,
    this.paymentTerm,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }
}
