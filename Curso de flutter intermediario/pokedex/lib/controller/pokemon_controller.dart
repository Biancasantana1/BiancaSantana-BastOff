import 'package:flutter/material.dart';

import '../model/results_model.dart';
import '../repository/pokedex_repository.dart';
import '../service/http_service.dart';
import '../utils/api_utils.dart';

class PokemonController with ChangeNotifier {
  List<Results> pokemonList = [];
  final repository = PokedexRepository(httpService: HttpService());
  bool isLoading = false;
  String nextUrl = API.requestPokedex;

  Future<void> loadMorePokemon() async {
    if (isLoading) return;

    isLoading = true;
    try {
      final newPokemon = await repository.fetchPokemonData(url: nextUrl);
      pokemonList.addAll(newPokemon.results);
      nextUrl = newPokemon.next;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
  }
}
