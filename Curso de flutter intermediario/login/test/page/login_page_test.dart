import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login/page/login_page.dart';

void main() {
  testWidgets(
      'LoginPage deve ter campos de texto de e-mail e senha, botão de login e botão de texto de inscrição',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    expect(find.widgetWithText(TextField, 'ex. eduardo@gmail.com'),
        findsOneWidget);

    expect(find.widgetWithText(TextField, '************'), findsOneWidget);

    expect(find.widgetWithText(ElevatedButton, 'Entrar na minha conta'),
        findsOneWidget);

    expect(find.widgetWithText(TextButton, 'Não tenho conta'), findsOneWidget);
  });
}
