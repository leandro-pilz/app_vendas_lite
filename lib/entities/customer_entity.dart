import 'package:app_vendas_lite/entities/entity.dart';

class CustomerEntity extends Entity {
  final String name;
  final String cpfCnpj;
  final String? email;
  final String? phone;

  CustomerEntity({
    super.id,
    required this.name,
    required this.cpfCnpj,
    this.email,
    this.phone,
    required super.status,
    required super.createAt,
    required super.updateAt,
  });
}
