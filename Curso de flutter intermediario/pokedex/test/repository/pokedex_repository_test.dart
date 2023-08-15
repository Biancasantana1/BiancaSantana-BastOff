// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;
// import 'package:pokedex/repository/pokedex_repository.dart';
// import 'package:pokedex/repository/pokedex_repository_interface.dart';
// import 'package:pokedex/service/http_service_interface.dart';

// class MockHttpService extends Mock implements IHttpService {}

// void main() {
//   late IPokedexRepository pokedexRepository;
//   late IHttpService mockHttpService;

//   setUp(() {
//     mockHttpService = MockHttpService();
//     pokedexRepository = PokedexRepository(httpService: mockHttpService);
//   });

//   test('Testando conexão com API', () async {
//     when(mockHttpService.fetchPokemonData()).thenAnswer((_) async => http.Response(
//         '{"name": "ditto", "height": 3, "weight": 4, "stats": [{"base_stat": 48, "effort": 0, "stat": {"name": "speed"}}], "moves": [{"move": {"name": "transform"}}], "sprites": {"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png"}}',
//         200));

//     final result = await pokedexRepository.fetchPokemonData();

//     expect(result.name, equals("ditto"));
//     expect(result.height, equals(3));
//     expect(result.weight, equals(4));
//     expect(result.stats.length, equals(1));
//     expect(result.stats[0].baseStat, equals(48));
//     expect(result.moves.length, equals(1));
//     expect(result.moves[0].move.name, equals("transform"));
//     expect(
//         result.sprites.frontDefault,
//         equals(
//             "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png"));
//   });
// }
