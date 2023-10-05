import '../data_base_helper.dart';
import '../entities/payment_term_entity.dart';
import '../repository/repository.dart';

class PaymentTermRepositoryImp implements Repository<PaymentTerm> {
  final DataBaseHelper database;

  PaymentTermRepositoryImp({required this.database});

  @override
  Future<PaymentTerm> findBy({required Map<String, dynamic> params}) {
    // TODO: implement findBy
    throw UnimplementedError();
  }

  @override
  Future<List<PaymentTerm>> findAllBy({required Map<String, dynamic> params}) {
    // TODO: implement findAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> createBy({required PaymentTerm data}) {
    // TODO: implement createBy
    throw UnimplementedError();
  }

  @override
  Future<void> createAllBy({required List<PaymentTerm> data}) {
    // TODO: implement createAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateBy({required PaymentTerm data}) {
    // TODO: implement updateBy
    throw UnimplementedError();
  }

  @override
  Future<void> updateAllBy({required List<PaymentTerm> data}) {
    // TODO: implement updateAllBy
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBy({required PaymentTerm data}) {
    // TODO: implement deleteBy
    throw UnimplementedError();
  }
}
