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

      for (var result in newPokemon.results) {
        final details = await repository.fetchPokemonDetails(result.url);
        result.imageUrl = details.sprites.officialArtwork;
        result.id = details.id;

        final typeInSlot1 = details.types.firstWhere((type) => type.slot == 1);
        result.color = getColorForType(typeInSlot1.type.name);
      }

      pokemonList.addAll(newPokemon.results);
      nextUrl = newPokemon.next;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
  }

  final Map<String, Color> typeColors = {
    'grass': const Color(0xFF74CB48),
    'fire': const Color(0xFFF57D31),
    'water': const Color(0xFF6493EB),
    'bug': const Color(0xFFA7B723),
    'electric': const Color(0xFFF9CF30),
    'ghost': const Color(0xFF70559B),
    'normal': const Color(0xFFAAA67F),
    'psychic': const Color(0xFFFB5584),
    'steel': const Color(0xFFB7B9D0),
  };

  Color getColorForType(String typeName) {
    return typeColors[typeName] ?? Colors.grey;
  }

  void sortPokemon() {
    pokemonList.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void searchPokemon(String query) {
    if (query.isEmpty) {
      // Se a consulta estiver vazia, recarregue todos os Pokémons
      loadMorePokemon();
      return;
    }

    final filteredPokemon = pokemonList
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Atualize a lista de Pokémons com os resultados filtrados
    pokemonList = filteredPokemon;
    notifyListeners();
  }
}
