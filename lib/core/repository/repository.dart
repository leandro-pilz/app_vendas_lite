import '../entities/entity.dart';

abstract interface class Repository<T extends Entity> {
  Future<T> findBy({required Map<String, dynamic> params});

  Future<List<T>> findAllBy({required Map<String, dynamic> params});

  Future<void> createBy({required T data});

  Future<void> createAllBy({required List<T> data});

  Future<void> updateBy({required T data});

  Future<void> updateAllBy({required List<T> data});

  Future<void> deleteBy({required T data});
}
