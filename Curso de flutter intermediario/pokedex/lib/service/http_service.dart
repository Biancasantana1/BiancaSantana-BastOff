import 'package:pokedex/service/http_service_interface.dart';
import 'package:http/http.dart' as http;
import '../utils/api_utils.dart';

class HttpService implements IHttpService {
  @override
  Future<http.Response> fetchPokemonData({String url = API.requestPokedex}) {
    return http.get(Uri.parse(url));
  }

  @override
  Future<http.Response> fetchPokemonDetails(String url) {
    return http.get(Uri.parse(url));
  }
}
