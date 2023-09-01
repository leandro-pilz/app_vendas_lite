import 'package:app_vendas_lite/entities/entity.dart';

abstract interface class Dao<S extends Entity> {
  Future<S> findBy({required Map<String, dynamic> params});

  Future<List<S>> findAllBy({required Map<String, dynamic> params});

  Future<bool> createAllBy({required List<S> data});

  Future<bool> updateAllBy({required List<S> data});

  Future<bool> deleteBy({required S data});
}
