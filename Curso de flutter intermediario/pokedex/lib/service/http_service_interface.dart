import 'package:http/http.dart' as http;

abstract class IHttpService {
  Future<http.Response> fetchPokemonData({String url});
  Future<http.Response> fetchPokemonDetails(String url);
}
