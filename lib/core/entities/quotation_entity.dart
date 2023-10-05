import 'customer_entity.dart';
import 'entity.dart';
import 'form_payment_entity.dart';
import 'payment_term_entity.dart';
import 'quotation_item_entity.dart';

final class QuotationEntity extends Entity {
  final String quotationNumber;
  double amount;
  DateTime? deliveryDate;
  String? note;
  final Customer customer;
  FormPayment? formPayment;
  PaymentTerm? paymentTerm;
  final List<QuotationItemEntity> items;

  QuotationEntity({
    super.id,
    super.externalId,
    required this.quotationNumber,
    required this.amount,
    this.deliveryDate,
    this.note,
    required this.customer,
    this.formPayment,
    this.paymentTerm,
    required super.status,
    required super.createAt,
    required super.updateAt,
    required this.items,
  });

  @override
  String filter() {
    throw UnimplementedError();
  }

  void sumAmount() {
    amount = 0.0;
    for (var item in items) {
      amount += item.amountItem();
    }
  }
}