import 'package:flutter/material.dart';
import '../model/pokemon_model.dart';
import '../repository/pokedex_repository.dart';
import '../service/http_service.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String url;

  const PokemonDetailsPage({super.key, required this.url});

  @override
  PokemonDetailsPageState createState() => PokemonDetailsPageState();
}

class PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late Future<Pokemon> futurePokemonDetails;

  @override
  void initState() {
    super.initState();
    final repository = PokedexRepository(httpService: HttpService());
    futurePokemonDetails = repository.fetchPokemonDetails(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Pokémon')),
      body: FutureBuilder<Pokemon>(
        future: futurePokemonDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final pokemon = snapshot.data!;
            return Text(
                'Nome: ${pokemon.name}, Altura: ${pokemon.height}, Peso: ${pokemon.weight}');
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
