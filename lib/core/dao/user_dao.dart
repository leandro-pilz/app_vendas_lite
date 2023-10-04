import '/core/adapters/user_adapter.dart';
import '/core/entities/entity.dart';
import '/core/entities/user_entity.dart';
import '../data_base_helper.dart';
import 'dao.dart';

class UsuarioDao implements Dao {
  final DataBaseHelper database;

  UsuarioDao({required this.database});

  @override
  Future<Entity> findBy({required Map<String, dynamic> params}) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  Future<List<Entity>> findAllBy({required Map<String, dynamic> params}) async {
    // TODO: implement createAllBy
    throw UnimplementedError();
  }

  @override
  Future<bool> createAllBy({required List<Entity> data}) async {
    return await database.createAllBy(tableName: 'usuario', values: UsuarioAdapter.entidadesParaMap(usuarios: (data as List<User>)));
  }

  @override
  Future<bool> updateAllBy({required List<Entity> data}) {
    // TODO: implement updateAllBy
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBy({required Entity data}) {
    // TODO: implement deleteBy
    throw UnimplementedError();
  }
}
