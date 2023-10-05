import '../entities/form_payment_entity.dart';

class FormPaymentAdapter {
  FormPayment mapToFormPayment({required Map<String, dynamic> map}) {
    return FormPayment(
      id: map['id'],
      externalId: map['idExterno'],
      code: map['codigo'],
      name: map['nome'],
      status: map['situacao'],
      createAt: map['criado_em'],
      updateAt: map['alterado_em'],
      paymentTerms: [],
    );
  }

  Map<String, dynamic> formPaymentToMap({required FormPayment formPayment}) {
    return {
      'id': formPayment.id,
      'idExterno': formPayment.externalId,
      'codigo': formPayment.code,
      'nome': formPayment.name,
      'situacao': formPayment.status,
      'criado_em': formPayment.createAt,
      'alterado_em': formPayment.updateAt,
    };
  }
}
