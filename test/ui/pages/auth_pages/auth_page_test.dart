import 'package:app_vendas_lite/ui/pages/auth_pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final inputLoginWidget = find.byKey(const ValueKey('938497b7-8665-4d97-acf5-5432d690f8fc'));
  final passwordInputWidget = find.byKey(const ValueKey('e38a1e20-a36e-4b76-a0cf-7b5e8c2d2c83'));

  testWidgets('Validar se todos os widgets iniciais estão presentes na tela.', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));

    //Widgets de tela.
    final centerWidget = find.byKey(const ValueKey('861db839-bccd-4108-bd68-0da68b51c290'));
    final listViewWidget = find.byKey(const ValueKey('d6779fa9-ed65-4bc3-bfd1-363ed735dcc8'));
    final textViewLoginWidget = find.byKey(const ValueKey('9e9af5af-bb2a-4370-b45b-34ccc2829b7d'));
    final sizedBoxAfterTextLogin = find.byKey(const ValueKey('49427504-c16f-4b2b-8d25-8d1779459049'));
    final sizedBoxAfterInputTextLogin = find.byKey(const ValueKey('70db5c58-9636-4503-a0e2-8b92c16eddb1'));
    final sizedBoxAfterPasswordInputText = find.byKey(const ValueKey('247cc076-41bd-4587-a176-9d35c4f43ea5'));
    final filledButtonWidget = find.byKey(const ValueKey('1e9919e7-c9d4-4c8b-8012-7ead91d9b0b4'));

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
    final iconButton = find.byKey(const ValueKey('aec54743-c1a4-4ca7-bc18-4152d25d65b5'));
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
    final iconButton = find.byKey(const ValueKey('5445684f-bc90-4319-aa6e-c41e94259473'));
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
