import 'package:app_vendas_lite/entidades/entidade.dart';

class Usuario extends Entidade {
  final String nome;

  Usuario({
    super.id,
    required this.nome,
    required super.situacao,
    required super.createAt,
    required super.updateAt,
  });
}
