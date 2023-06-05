import 'package:conversor_moedas/service/dio_service.dart';
import 'package:dio/dio.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.hgbrasil.com/finance',
        headers: {
          'content-type': 'application/json;charset=utf-8',
        },
      ),
    );
  }
}
