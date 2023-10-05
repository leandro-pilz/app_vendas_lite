import '../entities/entity.dart';

abstract interface class Repository<E extends Entity> {
  ///Db implementation
  Future<E> findBy({required Map<String, dynamic> params});

  Future<List<E>> findAllBy({required Map<String, dynamic> params});

  Future<void> createBy({required E data});

  Future<List<E>> createAllBy({required List<E> data});

  Future<E> updateBy({required E data});

  Future<List<E>> updateAllBy({required List<E> data});

  Future<void> removeBy({required E data});

  ///Api implementation
  Future<E> getBy({required Map<String, dynamic> pathParams});

  Future<List<E>> getAllBy({Map<String, dynamic>? queryParams});

  Future<E> post({E? data, Map<String, dynamic>? pathParams});

  Future<E> put({required E data, Map<String, dynamic>? pathParams});

  Future<void> deleteBy({required Map<String, dynamic> pathParams});
}
