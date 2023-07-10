import 'package:conversor_moedas/controllers/conversao_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ConversaoController conversaoController;
  const double currencyBuyValue = 5.0;

  setUp(() {
    conversaoController = ConversaoController();
  });

  tearDown(() {
    conversaoController.dispose();
  });

  group('ConversaoController', () {
    test('updateResult deve atualizar o resultado com a conversão correta', () {
      conversaoController.controller.text = '10';
      conversaoController.updateResult(currencyBuyValue);

      expect(conversaoController.result, 50.0);
    });

    test(
        'updateResult deve definir o resultado como null se o campo de texto estiver vazio',
        () {
      conversaoController.controller.text = '';
      conversaoController.updateResult(currencyBuyValue);

      expect(conversaoController.result, null);
    });

    test('updateResult deve tratar valores não numéricos como zero', () {
      conversaoController.controller.text = 'não é um número';
      conversaoController.updateResult(currencyBuyValue);

      expect(conversaoController.result, 0.0);
    });
  });
}
