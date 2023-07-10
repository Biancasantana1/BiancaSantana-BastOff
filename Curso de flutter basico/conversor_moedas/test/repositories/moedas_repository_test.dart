import 'package:conversor_moedas/repositories/moedas_repository_imp.dart';
import 'package:conversor_moedas/service/dio_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final moedas = MoedasRepositoryImp(DioServiceImp());

  test('Testando conexão com API', () async {
    final result = await moedas.getMoedas();
    expect(result.results.currencies.currencyMap.isNotEmpty, equals(true));
    expect(result.results.currencies.currencyMap.length, equals(9));
    expect(result.results.currencies.currencyMap.values.first.buy, isNot(10.0));
  });
}
