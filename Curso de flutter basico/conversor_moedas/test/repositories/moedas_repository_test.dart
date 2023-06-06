import 'package:conversor_moedas/repositories/moedas_repository_imp.dart';
import 'package:conversor_moedas/service/dio_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter increments smoke test', () async {
     final moedas = MoedasRepositoryImp(
      DioServiceImp()
    );
     final result = await moedas.getMoedas();
     print(result.results.currencies.currencyMap.length);
  });
}
