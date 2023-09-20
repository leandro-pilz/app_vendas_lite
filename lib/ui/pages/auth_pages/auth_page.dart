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
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const Text(
            'Login',
            style: veryVeryLargeW600Style,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kSizedBoxLargeSpace),
          InputTextFormFieldCustom(label: 'Login', onChanged: (value) {}),
          const SizedBox(height: kSizedBoxLargeSpace),
          PassWordField(controller: TextEditingController(), label: 'Senha'),
          const SizedBox(height: kSizedBoxLargeSpace),
          FilledButtonCustom(title: 'Entrar', onPressed: () {}),
        ],
      ),
    );
  }
}
