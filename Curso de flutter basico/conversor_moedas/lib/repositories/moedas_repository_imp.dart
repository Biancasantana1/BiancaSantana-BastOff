import 'package:conversor_moedas/model/moedas_model.dart';
import 'package:conversor_moedas/repositories/moedas_repository.dart';
import 'package:conversor_moedas/service/dio_service.dart';

class MoedasRepositoryImp implements MoedasRepository {
  final DioService _dioService;

  MoedasRepositoryImp(this._dioService);

  @override
  Future<Moedas> getMoedas() async {
    //await Future.delayed(Duration(seconds: 3));
    try {
      var result =
          await _dioService.getDio().get('https://api.hgbrasil.com/finance?key=173e0827');
      var moedas = Moedas.fromJson(result.data);
      return moedas;
    } catch (error) {
      print('Erro: $error');
      throw Exception('Erro de conexão ao obter as moedas');
    }
  }
}
