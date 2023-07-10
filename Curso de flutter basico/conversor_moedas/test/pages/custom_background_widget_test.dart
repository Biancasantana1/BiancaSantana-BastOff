import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:conversor_moedas/widgets/custom_background_widget.dart';

void main() {
  testWidgets('CustomBackgroundWidget renderizado corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CustomBackgroundWidget(child: Text('Teste')),
      ),
    ));

    expect(find.byType(CustomBackgroundWidget), findsOneWidget);
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);
    final Image imageWidget = tester.widget(imageFinder);
    expect(imageWidget.image, isInstanceOf<AssetImage>());
    expect((imageWidget.image as AssetImage).assetName,
        'assets/img/imgFundoDinheiro.png');
  });
}
