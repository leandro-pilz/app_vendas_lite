import '../exceptions/exceptions.dart';
import 'entity.dart';
import 'user_entity.dart';

final class Customer extends Entity {
  final String name;
  final String cpfCnpj;
  String? email;
  String? phone;
  User? user;

  Customer({
    super.id,
    required super.externalId,
    required this.name,
    required this.cpfCnpj,
    this.email,
    this.phone,
    required super.status,
    required super.createAt,
    required super.updateAt,
    this.user,
  });

  @override
  String filter() {
    return '$name$cpfCnpj';
  }

  void userIsNullToSaveCustomer(){
    if(user == null || user?.id == null){
      throw const UserIsNullException(message: 'Usuário não está vinculado ao clinte, ou não está salvo no banco de dados');
    }
  }
}
