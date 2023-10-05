import '../entities/customer_entity.dart';

class CustomerAdapter {
  Customer mapApiToCustomer({required Map<String, dynamic> map}) {
    return Customer(
      id: map['id'],
      externalId: map['idExterno'],
      name: map['nome'],
      cpfCnpj: map['cpfCnpj'],
      email: map['email'],
      phone: map['telefone'],
      status: map['situacao'],
      createAt: map['criadoEm'],
      updateAt: map['alteradoEm'],
    );
  }

  Customer mapDbToCustomer({required Map<String, dynamic> map}) {
    return Customer(
      id: map['id'],
      externalId: map['id_externo'],
      name: map['nome'],
      cpfCnpj: map['cpf_cnpj'],
      email: map['email'],
      phone: map['telefone'],
      status: map['situacao'],
      createAt: map['criado_em'],
      updateAt: map['alterado_em'],
    );
  }

  Map<String, dynamic> customerToMap({required Customer customer}) {
    return {
      'id': customer.id,
      'idExterno': customer.externalId,
      'nome': customer.name,
      'cpfCnpj': customer.cpfCnpj,
      'email': customer.email,
      'telefone': customer.phone,
      'situacao': customer.status,
      'criado_em': customer.createAt,
      'alterado_em': customer.updateAt,
    };
  }
}
