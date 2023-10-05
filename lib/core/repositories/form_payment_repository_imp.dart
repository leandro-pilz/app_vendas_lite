import '../data_base_helper.dart';
import '../entities/form_payment_entity.dart';
import 'repository.dart';

class FormPaymentRepositoryImp implements Repository<FormPayment> {
  final DataBaseHelper database;

  FormPaymentRepositoryImp({required this.database});

  @override
  Future<FormPayment> findBy({required Map<String, dynamic> params}) {
    throw UnimplementedError();
  }

  @override
  Future<List<FormPayment>> findAllBy({required Map<String, dynamic> params}) {
    throw UnimplementedError();
  }

  @override
  Future<void> createBy({required FormPayment data}) {
    throw UnimplementedError();
  }

  @override
  Future<List<FormPayment>> createAllBy({required List<FormPayment> data}) {
    throw UnimplementedError();
  }

  @override
  Future<FormPayment> updateBy({required FormPayment data}) {
    throw UnimplementedError();
  }

  @override
  Future<List<FormPayment>> updateAllBy({required List<FormPayment> data}) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeBy({required FormPayment data}) {
    throw UnimplementedError();
  }

  @override
  Future<FormPayment> getBy({required Map<String, dynamic> pathParams}) {
    throw UnimplementedError();
  }

  @override
  Future<List<FormPayment>> getAllBy({Map<String, dynamic>? queryParams}) {
    throw UnimplementedError();
  }

  @override
  Future<FormPayment> post({FormPayment? data, Map<String, dynamic>? pathParams}) {
    throw UnimplementedError();
  }

  @override
  Future<FormPayment> put({required FormPayment data, Map<String, dynamic>? pathParams}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBy({required Map<String, dynamic> pathParams}) {
    throw UnimplementedError();
  }
}
