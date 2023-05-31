import 'package:dio/dio.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/collection/748',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlN2FiMTlkMWVjMTU4ZDgwNDljNTNlNzQ2NTdmM2FhOSIsInN1YiI6IjY0NmZjMDU3ODM5MDE4MDEzNDUyMjliOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.O71TYOKnckZ6-vkkPnsG4-26pxToYRN6DDggcDLZR34',
        },
      ),
    );
  }
}
