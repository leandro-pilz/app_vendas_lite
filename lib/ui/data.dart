import 'package:app_vendas_lite/entities/form_payment_entity.dart';
import 'package:app_vendas_lite/entities/payment_term_entity.dart';
import 'package:app_vendas_lite/entities/quotation_entity.dart';
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

final customers = List.generate(
  20,
  (index) => CustomerEntity(
    externalId: 'dfe14ea0-68b0-45a6-9363-75a6937ed77c$index',
    name: _customersName[index],
    cpfCnpj: UtilBrasilFields.gerarCNPJ(useFormat: true),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
);

final formPayments = [
  FormPaymentEntity(
    externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
    name: 'Boleto',
    status: true,
    createAt: _date,
    updateAt: _date,
    paymentTerms: [
      PaymentTermEntity(
        externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
        name: '30 dias',
        status: true,
        createAt: _date,
        updateAt: _date,
      ),
      PaymentTermEntity(
        externalId: '3203a35c-3e4d-4f58-b4ce-7c0348eef602',
        name: '60 dias',
        status: true,
        createAt: _date,
        updateAt: _date,
      )
    ],
  ),
  FormPaymentEntity(
    externalId: '9eef9414-d74f-4009-b401-e3a181cfded0',
    name: 'Cartão de débito',
    status: true,
    createAt: _date,
    updateAt: _date,
    paymentTerms: [
      PaymentTermEntity(
        externalId: '7d7175e4-f9b4-4cfd-a0cb-2cf4e818422d',
        name: 'À vista',
        status: true,
        createAt: _date,
        updateAt: _date,
      )
    ],
  ),
  FormPaymentEntity(
    externalId: 'e9203250-6d20-4c28-96a0-4ebb136b403b',
    name: 'Cartão de crédido',
    status: true,
    createAt: _date,
    updateAt: _date,
    paymentTerms: [
      PaymentTermEntity(
        externalId: '4a655dcd-8db8-4108-8b1d-d0beba9ba1a5',
        name: '1 x s/juros',
        status: true,
        createAt: _date,
        updateAt: _date,
      ),
      PaymentTermEntity(
        externalId: 'e21da299-1202-45c7-bcaa-247fe55b41a2',
        name: '2 x s/juros',
        status: true,
        createAt: _date,
        updateAt: _date,
      ),
      PaymentTermEntity(
        externalId: 'f002ecc9-4d00-4408-be22-b010ca963637',
        name: '3 x s/juros',
        status: true,
        createAt: _date,
        updateAt: _date,
      ),
      PaymentTermEntity(
        externalId: 'e9484c61-3ec5-4466-831d-deb6271833ea',
        name: '4 x com juros',
        status: true,
        createAt: _date,
        updateAt: _date,
      ),
      PaymentTermEntity(
        externalId: '45707584-fb14-43c6-a481-7f068fcd6a54',
        name: '5 x com juros',
        status: true,
        createAt: _date,
        updateAt: _date,
      ),
      PaymentTermEntity(
        externalId: 'd1cbc834-146a-4d24-a6c9-a162b29c77b5',
        name: '6 x com juros',
        status: true,
        createAt: _date,
        updateAt: _date,
      )
    ],
  ),
];

final _customerQuotation = CustomerEntity(
  externalId: 'b65ade5a-64a9-4c52-bd1a-b0fb743500d1',
  name: 'Magdiel lopes',
  cpfCnpj: '97.707.242/0001-51',
  status: true,
  createAt: _date,
  updateAt: _date,
);

final quotations = [
  QuotationEntity(
    externalId: '6bc8f3bb-9c68-451d-8565-f6cd9bb35196',
    quotationNumber: '001',
    customer: _customerQuotation,
    formPayment: FormPaymentEntity(
      externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
      name: 'Boleto',
      status: true,
      createAt: _date,
      updateAt: _date,
      paymentTerms: [],
    ),
    paymentTerm: PaymentTermEntity(
      externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
      name: '30 dias',
      status: true,
      createAt: _date,
      updateAt: _date,
    ),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
  QuotationEntity(
    externalId: '57ba4da6-e33d-476d-ba06-baaa918621c4',
    quotationNumber: '002',
    customer: _customerQuotation,
    formPayment: FormPaymentEntity(
      externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
      name: 'Boleto',
      status: true,
      createAt: _date,
      updateAt: _date,
      paymentTerms: [],
    ),
    paymentTerm: PaymentTermEntity(
      externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
      name: '30 dias',
      status: true,
      createAt: _date,
      updateAt: _date,
    ),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
  QuotationEntity(
    externalId: '1dac600d-59ac-4989-a964-c057c439577b',
    quotationNumber: '003',
    customer: _customerQuotation,
    formPayment: FormPaymentEntity(
      externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
      name: 'Boleto',
      status: true,
      createAt: _date,
      updateAt: _date,
      paymentTerms: [],
    ),
    paymentTerm: PaymentTermEntity(
      externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
      name: '30 dias',
      status: true,
      createAt: _date,
      updateAt: _date,
    ),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
  QuotationEntity(
    externalId: '64e14e76-7493-47f4-9d72-d401bd81531f',
    quotationNumber: '004',
    customer: _customerQuotation,
    formPayment: FormPaymentEntity(
      externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
      name: 'Boleto',
      status: true,
      createAt: _date,
      updateAt: _date,
      paymentTerms: [],
    ),
    paymentTerm: PaymentTermEntity(
      externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
      name: '30 dias',
      status: true,
      createAt: _date,
      updateAt: _date,
    ),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
  QuotationEntity(
    externalId: '66f83947-f0d4-4955-9298-19e00b62567f',
    quotationNumber: '005',
    customer: _customerQuotation,
    formPayment: FormPaymentEntity(
      externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
      name: 'Boleto',
      status: true,
      createAt: _date,
      updateAt: _date,
      paymentTerms: [],
    ),
    paymentTerm: PaymentTermEntity(
      externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
      name: '30 dias',
      status: true,
      createAt: _date,
      updateAt: _date,
    ),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
  QuotationEntity(
    externalId: '832601b4-1662-4b61-bcb8-d60871d26529',
    quotationNumber: '006',
    customer: _customerQuotation,
    formPayment: FormPaymentEntity(
      externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
      name: 'Boleto',
      status: true,
      createAt: _date,
      updateAt: _date,
      paymentTerms: [],
    ),
    paymentTerm: PaymentTermEntity(
      externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
      name: '30 dias',
      status: true,
      createAt: _date,
      updateAt: _date,
    ),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
  QuotationEntity(
    externalId: '266640b8-ab8b-44dc-b2b4-46a51310e624',
    quotationNumber: '007',
    customer: _customerQuotation,
    formPayment: FormPaymentEntity(
      externalId: '16428074-48a3-4a4a-b1d9-128cb987eb6a',
      name: 'Boleto',
      status: true,
      createAt: _date,
      updateAt: _date,
      paymentTerms: [],
    ),
    paymentTerm: PaymentTermEntity(
      externalId: 'be391bce-6e40-4bf6-9103-b73ba8778c7f',
      name: '30 dias',
      status: true,
      createAt: _date,
      updateAt: _date,
    ),
    status: true,
    createAt: _date,
    updateAt: _date,
  ),
];
