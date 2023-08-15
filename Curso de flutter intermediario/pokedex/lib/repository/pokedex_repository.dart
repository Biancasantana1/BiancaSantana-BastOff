import 'dart:convert';
import 'package:pokedex/repository/pokedex_repository_interface.dart';
import '../model/pokedex_model.dart';
import '../model/pokemon_model.dart';
import '../service/http_service_interface.dart';
import '../utils/api_utils.dart';

class PokedexRepository implements IPokedexRepository {
  final IHttpService httpService;

  PokedexRepository({required this.httpService});

  @override
  Future<Pokedex> fetchPokemonData({String url = API.requestPokedex}) async {
    final response = await httpService.fetchPokemonData(url: url);

    if (response.statusCode == 200) {
      return Pokedex.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha na requisição');
    }
  }

  @override
  Future<Pokemon> fetchPokemonDetails(String url) async {
    final response = await httpService.fetchPokemonDetails(url);

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha na requisição');
    }
  }
}
