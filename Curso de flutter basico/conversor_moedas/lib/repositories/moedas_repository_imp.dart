import 'package:conversor_moedas/model/moedas_model.dart';
import 'package:conversor_moedas/repositories/moedas_repository.dart';
import 'package:conversor_moedas/service/dio_service.dart';
import 'package:dio/dio.dart';

class MoedasRepositoryImp implements MoedasRepository {
  final DioService _dioService;

  MoedasRepositoryImp(this._dioService);

  @override
  Future<Moedas> getMoedas() async {
    try {
      var response = await _dioService
          .getDio()
          .get('https://api.hgbrasil.com/finance?key=d46e971e');
      if (response.statusCode == 200) {
        var moedas = Moedas.fromJson(response.data);
        return moedas;
      } else {
        throw Exception('Erro de status code: ${response.statusCode}');
      }
    } on DioError {
      throw Exception('Erro de conexão ao obter as moedas');
    } catch (error) {
      throw Exception('Erro desconhecido ao obter as moedas');
    }
  }
}
