import 'package:app_vendas_lite/ui/pages/auth_pages/auth_page.dart';
import 'package:app_vendas_lite/ui/widgets/input_text_field_custom.dart';
import 'package:app_vendas_lite/ui/widgets/password_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final inputLoginWidget = find.byKey(authPageInputTextFormFieldKey);
  final passwordInputWidget = find.byKey(authPagePassWordFieldKey);

  testWidgets('Validar se todos os widgets iniciais estão presentes na tela.', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));

    //Widgets de tela.
    final centerWidget = find.byKey(authPageCenterBodyKey);
    final listViewWidget = find.byKey(authPageListViewKey);
    final textViewLoginWidget = find.byKey(authPageTextLoginKey);
    final sizedBoxAfterTextLogin = find.byKey(authPageSizeBoxAfterTextLoginKey);
    final sizedBoxAfterInputTextLogin = find.byKey(authPageSizeBoxAfterInputTextFormFieldKey);
    final sizedBoxAfterPasswordInputText = find.byKey(authPageSizeBoxAfterPassWordFieldKey);
    final filledButtonWidget = find.byKey(authPageFilledButtonCustomKey);

    //Expected
    expect(centerWidget, findsOneWidget);
    expect(listViewWidget, findsOneWidget);
    expect(textViewLoginWidget, findsOneWidget);
    expect(sizedBoxAfterTextLogin, findsOneWidget);
    expect(inputLoginWidget, findsOneWidget);
    expect(sizedBoxAfterInputTextLogin, findsOneWidget);
    expect(passwordInputWidget, findsOneWidget);
    expect(sizedBoxAfterPasswordInputText, findsOneWidget);
    expect(filledButtonWidget, findsOneWidget);
    expect(find.text('Login'), findsNWidgets(2));
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });

  testWidgets('Validar se o campo de login ao receber um texto, mostra o butão para limpar o campo e ao clicar no mesmo limpa o campo',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));

    //Login field testes.
    final iconButton = find.byKey(inputTextFormFieldClearTextIconKey);
    await tester.enterText(inputLoginWidget, 'hi');
    await tester.pump();
    await tester.tap(iconButton);
    await tester.pump();

    expect(find.text('hi'), findsNothing);
    expect(iconButton, findsNothing);
  });

  testWidgets('Valida se o campo senha contem o valor informado e valida a troca de icone ao clicar no botão para mostrar senha',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));

    //Login field testes.
    final iconButton = find.byKey(passWordIconVisiblePasswordKey);
    final iconVisibility = find.byIcon(Icons.visibility);
    final visibilityOff = find.byIcon(Icons.visibility_off);
    await tester.enterText(passwordInputWidget, '@123Senha');
    await tester.tap(iconButton);
    await tester.pump();

    expect(find.text('@123Senha'), findsOneWidget);
    expect(iconVisibility, findsNothing);
    expect(visibilityOff, findsOneWidget);
  });
}
