import '../data_base_helper.dart';
import '../entities/customer_entity.dart';
import '../repository/repository.dart';

class CustomerRepositoryImp implements Repository<Customer> {
  final DataBaseHelper database;

  CustomerRepositoryImp({required this.database});

  @override
  Future<Customer> findBy({required Map<String, dynamic> params}) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> findAllBy({required Map<String, dynamic> params}) {
    // TODO: implement findAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> createBy({required Customer data}) {
    // TODO: implement createBy
    throw UnimplementedError();
  }

  @override
  Future<void> createAllBy({required List<Customer> data}) {
    // TODO: implement createAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateBy({required Customer data}) {
    // TODO: implement updateBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateAllBy({required List<Customer> data}) {
    // TODO: implement updateAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBy({required Customer data}) {
    // TODO: implement deleteBy
    throw UnimplementedError();
  }
}
