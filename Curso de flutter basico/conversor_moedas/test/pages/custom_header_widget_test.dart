import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:conversor_moedas/widgets/custom_header_widget.dart';

void main() {
  testWidgets('CustomHeaderWidget está renderizando corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CustomHeaderWidget(),
      ),
    ));

    expect(find.byType(CustomHeaderWidget), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.text('Toodoo - Desenvolvimento de Software'), findsOneWidget);
  });
}
