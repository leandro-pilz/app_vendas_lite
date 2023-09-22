import 'package:app_vendas_lite/ui/utils/constants.dart';
import 'package:app_vendas_lite/ui/utils/text_style_utils.dart';
import 'package:app_vendas_lite/ui/widgets/filled_button_custom.dart';
import 'package:app_vendas_lite/ui/widgets/input_text_field_custom.dart';
import 'package:flutter/material.dart';

import '/ui/widgets/password_field_custom.dart';
import '../../widgets/app_scaffold.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late bool isLoading;

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      key: const ValueKey('861db839-bccd-4108-bd68-0da68b51c290'),
      child: ListView(
        key: const ValueKey('d6779fa9-ed65-4bc3-bfd1-363ed735dcc8'),
        shrinkWrap: true,
        children: [
          const Text(
            key: ValueKey('9e9af5af-bb2a-4370-b45b-34ccc2829b7d'),
            'Login',
            style: veryVeryLargeW600Style,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            key: ValueKey('49427504-c16f-4b2b-8d25-8d1779459049'),
            height: kSizedBoxLargeSpace,
          ),
          InputTextFormFieldCustom(
            key: const ValueKey('938497b7-8665-4d97-acf5-5432d690f8fc'),
            label: 'Login',
            onChanged: (value) {},
          ),
          const SizedBox(
            key: ValueKey('70db5c58-9636-4503-a0e2-8b92c16eddb1'),
            height: kSizedBoxLargeSpace,
          ),
          PassWordField(
            key: const ValueKey('e38a1e20-a36e-4b76-a0cf-7b5e8c2d2c83'),
            controller: TextEditingController(),
            label: 'Senha',
          ),
          const SizedBox(
            key: ValueKey('247cc076-41bd-4587-a176-9d35c4f43ea5'),
            height: kSizedBoxLargeSpace,
          ),
          FilledButtonCustom(
            key: const ValueKey('1e9919e7-c9d4-4c8b-8012-7ead91d9b0b4'),
            title: 'Entrar',
            isLoading: isLoading,
            onPressed: () {
              setState(() {
                isLoading = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
