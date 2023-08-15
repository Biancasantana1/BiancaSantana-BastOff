import '../model/pokedex_model.dart';
import '../model/pokemon_model.dart';

abstract class IPokedexRepository {
  Future<Pokedex> fetchPokemonData({String url});
  Future<Pokemon> fetchPokemonDetails(String url);
}
