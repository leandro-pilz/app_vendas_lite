import '../entities/payment_term_entity.dart';

class PaymentTermAdapter {
  PaymentTerm mapDbToFormPayment({required Map<String, dynamic> map}) {
    return PaymentTerm(
      id: map['id'],
      externalId: map['id_externo'],
      code: map['codigo'],
      name: map['nome'],
      status: map['situacao'],
      createAt: map['criado_em'],
      updateAt: map['alterado_em'],
    );
  }

  Map<String, dynamic> formPaymentToMap({required PaymentTerm paymentTerm}) {
    return {
      'id': paymentTerm.id,
      'codigo': paymentTerm.code,
      'id_externo': paymentTerm.externalId,
      'nome': paymentTerm.name,
      'situacao': paymentTerm.status,
      'criado_em': paymentTerm.createAt,
      'alterado_em': paymentTerm.updateAt,
    };
  }
}
