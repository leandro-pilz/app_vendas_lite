import 'package:app_vendas_lite/ui/pages/auth_pages/auth_page.dart';
import 'package:app_vendas_lite/ui/utils/constants.dart';
import 'package:app_vendas_lite/ui/utils/text_style_utils.dart';
import 'package:app_vendas_lite/ui/widgets/filled_button_custom.dart';
import 'package:app_vendas_lite/ui/widgets/input_text_field_custom.dart';
import 'package:app_vendas_lite/ui/widgets/password_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: AuthPage(),
      ),
    );

    expect(find.text('Login'), findsNWidgets(2));
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);

    //Login field testes.
    await tester.enterText(find.byType(InputTextFormFieldCustom), 'hi');
    expect(find.text('hi'), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    await tester.tap(find.byType(IconButton));

    await tester.pump();

    // expect(find.byType(IconButton), findsNothing);
    // expect(find.byType(Icon), findsNothing);

    // expect(find.text('hi'), findsNothing);

  });
}
