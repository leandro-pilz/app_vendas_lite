import '../data_base_helper.dart';
import '../entities/user_entity.dart';
import 'repository.dart';

class UserRepositoryImp implements Repository<User> {
  final DataBaseHelper database;

  UserRepositoryImp({required this.database});

  @override
  Future<User> findBy({required Map<String, dynamic> params}) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> findAllBy({required Map<String, dynamic> params}) {
    throw UnimplementedError();
  }

  @override
  Future<User> createBy({required User data}) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> createAllBy({required List<User> data}) async {
    throw UnimplementedError();
  }

  @override
  Future<User> updateBy({required User data}) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> updateAllBy({required List<User> data}) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeBy({required data}) {
    throw UnimplementedError();
  }

  @override
  Future<User> getBy({required Map<String, dynamic> pathParams}) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAllBy({Map<String, dynamic>? queryParams}) {
    throw UnimplementedError();
  }

  @override
  Future<User> post({User? data, Map<String, dynamic>? pathParams}) {
    throw UnimplementedError();
  }

  @override
  Future<User> put({required User data, Map<String, dynamic>? pathParams}) {
    throw UnimplementedError();
  }

  @override
  Future<User> deleteBy({required Map<String, dynamic> pathParams}) {
    throw UnimplementedError();
  }
}
