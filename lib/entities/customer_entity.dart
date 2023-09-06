import 'package:app_vendas_lite/entities/entity.dart';

class CustomerEntity extends Entity {
  String name;
  String cpfCnpj;
  String? email;
  String? phone;

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

  @override
  String filter() {
    return '$name$cpfCnpj';
  }
}
