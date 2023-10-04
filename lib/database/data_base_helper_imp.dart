import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_02_00_token_usuario.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_02_01_token_indice_usuario.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_03_00_cliente.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_03_01_cliente_indice_usuario.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_04_00_forma_pagamento.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_05_00_condicao_pagamento.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_05_01_condicao_pagamento_indice_forma_pagamento.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_06_00_sku.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_06_01_sku_indice_cod_produto.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_06_02_sku_indice_usuario_nome.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_07_00_preco.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_08_00_estoque.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_09_00_numero_cotacao.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_09_01_numero_cotacao_indice_usuario.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_10_00_cotacao.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_10_01_cotacao_indice_cliente.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_10_02_cotacao_indice_condicao_pagamento.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_10_03_cotacao_indice_forma_pagamento.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_10_04_cotacao_indice_usuario.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_11_00_item_cotacao.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_11_01_item_cotacao_indice_cotacao.dart';
import 'package:app_vendas_lite/database/migrations/V_1/migration_v1_11_02_item_cotacao_indice_sku.dart';
import 'package:sqflite/sqflite.dart';

import 'data_base_helper.dart';
import 'exception_db.dart';
import 'migrations/V_1/migration_v1_01_00_usuario.dart';

class DataBaseHelperImp implements DataBaseHelper {
  static const _databaseName = "app_vendas.db";
  static const _databaseVersion = 1;

  Future<Database>? _db;

  DataBaseHelperImp() {
    _db ??= _initDb();
  }

  Future onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> _initDb() async {
    final db = await openDatabase(
      _databaseName,
      onConfigure: onConfigure,
      version: _databaseVersion,
      onCreate: (dataBase, version) async {
        final batch = dataBase.batch();
        createTableUserV1_01_00_Usuario(batch: batch);
        createTableUserV1_02_00_TokenUsuario(batch: batch);
        createTableUserV1_02_01_TokenIndiceUsuario(batch: batch);
        createTableUserV1_03_00_Cliente(batch: batch);
        createTableUserV1_03_01_ClienteIndexUsuario(batch: batch);
        createTableUserV1_04_00_FormaPagamento(batch: batch);
        createTableUserV1_05_00_CondicaoPagamento(batch: batch);
        createTableUserV1_05_01_CondicaoPagamentoIndiceFormaPagamento(batch: batch);
        createTableUserV1_06_00_Sku(batch: batch);
        createTableUserV1_06_01_SkuIndiceCodProduto(batch: batch);
        createTableUserV1_06_02_SkuIndiceUsuarioNome(batch: batch);
        createTableUserV1_07_00_Preco(batch: batch);
        createTableUserV1_08_00_Estoque(batch: batch);
        createTableUserV1_09_00_NumeroCotacao(batch: batch);
        createTableUserV1_09_01_NumeroCotacaoIndiceCotacao(batch: batch);
        createTableUserV1_10_00_Cotacao(batch: batch);
        createTableUserV1_10_01_CotacaoIndiceCliente(batch: batch);
        createTableUserV1_10_02_CotacaoIndiceCondicaoPagamento(batch: batch);
        createTableUserV1_10_03_CotacaoIndiceFormaPagamento(batch: batch);
        createTableUserV1_10_04_CotacaoIndiceUsuario(batch: batch);
        createTableUserV1_11_00_ItemCotacao(batch: batch);
        createTableUserV1_11_01_ItemCotacaoIndiceCotacao(batch: batch);
        createTableUserV1_11_02_ItemCotacaoIndiceSku(batch: batch);
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
