import 'package:conversor_moedas/pages/conversao_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:conversor_moedas/model/moeda_model.dart';

void main() {
  testWidgets('Valor da conversão aparece na tela após a entrada de texto',
      (WidgetTester tester) async {
    final Moeda testCurrency = Moeda(
      name: 'Dollar',
      buy: 5.00,
      sell: 5.00,
      variation: 0.0,
    );

    await tester.pumpWidget(MaterialApp(
      home: ConversaoPage(currency: testCurrency),
    ));

    final textField = find.byType(TextField).first;
    await tester.enterText(textField, '10');
    await tester.pumpAndSettle();
    expect(find.text('R\$: 50.00'), findsOneWidget);
  });
}
