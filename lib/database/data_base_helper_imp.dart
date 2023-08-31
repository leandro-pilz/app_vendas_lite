import 'package:sqflite/sqflite.dart';

import 'data_base_helper.dart';
import 'exception_db.dart';
import 'migrations/migration_v1.dart';

class DataBaseHelperImp implements DataBaseHelper {
  static const _databaseName = "app_vendas.db";
  static const _databaseVersion = 1;

  Future<Database>? _db;

  DataBaseHelperImp() {
    _db ??= _initDb();
  }

  Future<Database> _initDb() async {
    final db = await openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: (dataBase, version) async {
        final batch = dataBase.batch();
        createTableUserV1(batch: batch);
        await batch.commit();
      },
      onUpgrade: (dataBase, int oldVersion, int newVersion) {},
    );
    return db;
  }

  @override
  Future<bool> isOpen() async {
    return (await _db)?.isOpen ?? false;
  }

  @override
  Future<void> close() async {
    (await _db)?.close();
  }

  @override
  Future<Map> findBy({required String tableName, String? filter, required Map<String, dynamic> params}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map>> findAllBy({required String tableName, String? filter, required Map<String, dynamic> params}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> createAllBy({required String tableName, required List<Map<String, dynamic>> values}) async {
    try {
      (await _db)?.transaction((txn) async {
        for (var line in values) {
          await txn.insert(tableName, line);
        }
      });
    } on DatabaseException catch (e) {
      _exceptions(exceptions: e);
    }

    return true;
  }

  @override
  Future<bool> updateAllBy({required String tableName, required Map<String, dynamic> args, required List<Map<String, dynamic>> values}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBy({required String tableName, required Map<String, dynamic> args}) {
    throw UnimplementedError();
  }

  void _exceptions({required DatabaseException exceptions}) {
    if (exceptions.isDuplicateColumnError()) {
      throw DuplicateColumnError(message: 'Colunas duplicadas verifique: ${exceptions.toString()}');
    }

    if (exceptions.isSyntaxError()) {
      throw SyntaxError(message: 'Erro de sintaxe verique: ${exceptions.toString()}');
    }

    if (exceptions.isDatabaseClosedError()) {
      throw DatabaseClosedError(message: 'Banco de dados fechado verifique: ${exceptions.toString()}');
    }

    if (exceptions.isUniqueConstraintError()) {
      throw UniqueConstraintError(message: 'Não é permitido duplicidade do dado, verifique: ${exceptions.toString()}');
    }

    if (exceptions.isNotNullConstraintError()) {
      throw NotNullConstraintError(message: 'Não é permitido valor nulo, verifique: ${exceptions.toString()}');
    }

    throw GenericError(message: 'Verifique o erro não catalogado: ${exceptions.toString()}');
  }
}
