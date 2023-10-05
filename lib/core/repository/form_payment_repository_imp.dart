import '../data_base_helper.dart';
import '../entities/form_payment_entity.dart';
import 'repository.dart';

class FormPaymentRepositoryImp implements Repository<FormPayment> {
  final DataBaseHelper database;

  FormPaymentRepositoryImp({required this.database});

  @override
  Future<List<FormPayment>> findAllBy({required Map<String, dynamic> params}) {
    // TODO: implement findAllBy
    throw UnimplementedError();
  }

  @override
  Future<FormPayment> findBy({required Map<String, dynamic> params}) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  Future<void> createBy({required FormPayment data}) {
    // TODO: implement createBy
    throw UnimplementedError();
  }

  @override
  Future<void> createAllBy({required List<FormPayment> data}) async {
    // TODO: implement createAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateBy({required FormPayment data}) {
    // TODO: implement updateBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateAllBy({required List<FormPayment> data}) {
    // TODO: implement updateAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBy({required data}) {
    // TODO: implement deleteBy
    throw UnimplementedError();
  }
}
