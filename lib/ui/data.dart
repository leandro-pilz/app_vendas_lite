import 'package:brasil_fields/brasil_fields.dart';

import '../entities/customer_entity.dart';

final _date = DateTime.now();

final _customersName = [
  'Diogo Casalinho Letras',
  'Tomé Brito',
  'Noa Catalina Festas',
  'Larissa Cássia de Borba',
  'Enzo Paulo Macedo Oliveira',
  'Diana Macedo',
  'Adriela Gago',
  'Isaac Mata de Mont Alverne',
  'Lília Berta Beiriz',
  'Ian Roberto Mendes Doutis Falcão',
  'Vítor Bicalho',
  'Fábio Caldas',
  'Rania Anes Cachoeira',
  'kyara Berta Lisboa',
  'Flávia Ilha Pederneiras',
  'Núria Deise Simas de Varela',
  'Nelson Luan Moreira Franca',
  'Tomás Danilo Gaspar Robalinho',
  'Mia Diana Anes de Areosa',
  'Magdiel lopes',
];

final customers = List.generate(20, (index) => CustomerEntity(
  name: _customersName[index],
  cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
  status: true,
  createAt: _date,
  updateAt: _date,
));