import 'package:flutter/material.dart';

import '/ui/utils/constants.dart';
import '/ui/utils/text_style_utils.dart';
import '/ui/widgets/app_scaffold.dart';
import '/ui/widgets/filled_button_custom.dart';
import '/ui/widgets/input_text_field_custom.dart';
import '/ui/widgets/password_field_custom.dart';

const authPageCenterBodyKey = ValueKey('861db839-bccd-4108-bd68-0da68b51c290');
const authPageListViewKey = ValueKey('d6779fa9-ed65-4bc3-bfd1-363ed735dcc8');
const authPageTextLoginKey = ValueKey('9e9af5af-bb2a-4370-b45b-34ccc2829b7d');
const authPageSizeBoxAfterTextLoginKey = ValueKey('49427504-c16f-4b2b-8d25-8d1779459049');
const authPageInputTextFormFieldKey = ValueKey('938497b7-8665-4d97-acf5-5432d690f8fc');
const authPageSizeBoxAfterInputTextFormFieldKey = ValueKey('70db5c58-9636-4503-a0e2-8b92c16eddb1');
const authPagePassWordFieldKey = ValueKey('e38a1e20-a36e-4b76-a0cf-7b5e8c2d2c83');
const authPageSizeBoxAfterPassWordFieldKey = ValueKey('247cc076-41bd-4587-a176-9d35c4f43ea5');
const authPageFilledButtonCustomKey = ValueKey('1e9919e7-c9d4-4c8b-8012-7ead91d9b0b4');

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
      key: authPageCenterBodyKey,
      child: ListView(
        key: authPageListViewKey,
        shrinkWrap: true,
        children: [
          const Text(
            key: authPageTextLoginKey,
            'Login',
            style: veryVeryLargeW600Style,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            key: authPageSizeBoxAfterTextLoginKey,
            height: kSizedBoxLargeSpace,
          ),
          InputTextFormFieldCustom(
            key: authPageInputTextFormFieldKey,
            label: 'Login',
            onChanged: (value) {},
          ),
          const SizedBox(
            key: authPageSizeBoxAfterInputTextFormFieldKey,
            height: kSizedBoxLargeSpace,
          ),
          PassWordField(
            key: authPagePassWordFieldKey,
            controller: TextEditingController(),
            label: 'Senha',
          ),
          const SizedBox(
            key: authPageSizeBoxAfterPassWordFieldKey,
            height: kSizedBoxLargeSpace,
          ),
          FilledButtonCustom(
            key: authPageFilledButtonCustomKey,
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
