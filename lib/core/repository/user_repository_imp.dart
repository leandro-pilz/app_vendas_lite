import '../data_base_helper.dart';
import '../entities/user_entity.dart';
import 'repository.dart';

class UserRepositoryImp implements Repository<User> {
  final DataBaseHelper database;

  UserRepositoryImp({required this.database});

  @override
  Future<List<User>> findAllBy({required Map<String, dynamic> params}) {
    // TODO: implement findAllBy
    throw UnimplementedError();
  }

  @override
  Future<User> findBy({required Map<String, dynamic> params}) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  Future<void> createBy({required User data}) {
    // TODO: implement createBy
    throw UnimplementedError();
  }

  @override
  Future<void> createAllBy({required List<User> data}) async {
    // TODO: implement createAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateBy({required User data}) {
    // TODO: implement updateBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateAllBy({required List<User> data}) {
    // TODO: implement updateAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBy({required data}) {
    // TODO: implement deleteBy
    throw UnimplementedError();
  }
}
