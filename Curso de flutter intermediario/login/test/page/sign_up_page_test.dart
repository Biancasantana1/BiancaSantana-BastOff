import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login/page/sign_up_page.dart';

void main() {
  testWidgets(
      'SignUpPagedeve ter campos de texto de nome, e-mail e senha, botão de inscrição e botão de texto de login',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignUpPage(),
    ));

    expect(
        find.widgetWithText(TextField, 'ex. Eduardo Barros'), findsOneWidget);

    expect(find.widgetWithText(TextField, 'ex. eduardo@gmail.com'),
        findsOneWidget);

    expect(find.widgetWithText(TextField, '************'), findsOneWidget);

    expect(find.widgetWithText(ElevatedButton, 'Criar conta'), findsOneWidget);

    expect(find.widgetWithText(TextButton, 'Já possuo conta'), findsOneWidget);
  });
}
