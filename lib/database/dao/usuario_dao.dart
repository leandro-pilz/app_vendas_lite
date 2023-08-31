import 'package:app_vendas_lite/adapters/usuario_adapter.dart';
import 'package:app_vendas_lite/database/dao/dao.dart';
import 'package:app_vendas_lite/entidades/entidade.dart';
import 'package:app_vendas_lite/entidades/usuario.dart';

import '../data_base_helper.dart';

class UsuarioDao implements Dao {
  final DataBaseHelper database;

  UsuarioDao({required this.database});

  @override
  Future<Entidade> findBy({required Map<String, dynamic> params}) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  Future<List<Entidade>> findAllBy({required Map<String, dynamic> params}) async {
    // TODO: implement createAllBy
    throw UnimplementedError();
  }

  @override
  Future<bool> createAllBy({required List<Entidade> data}) async {
    return await database.createAllBy(tableName: 'usuario', values: UsuarioAdapter.entidadesParaMap(usuarios: (data as List<Usuario>)));
  }

  @override
  Future<bool> updateAllBy({required List<Entidade> data}) {
    // TODO: implement updateAllBy
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBy({required Entidade data}) {
    // TODO: implement deleteBy
    throw UnimplementedError();
  }
}
