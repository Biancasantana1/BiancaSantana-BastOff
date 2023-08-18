import 'package:flutter/material.dart';

import '../model/pokemon_model.dart';
import '../repository/pokedex_repository.dart';
import '../service/http_service.dart';
import '../utils/color_utils.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String url;

  const PokemonDetailsPage({
    super.key,
    required this.url,
  });

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
    return FutureBuilder<Pokemon>(
      future: futurePokemonDetails,
      builder: (context, snapshot) {
        AppBar appBar = AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              snapshot.hasData
                  ? Text(
                      snapshot.data!.name,
                      style: (const TextStyle(
                        color: AppColors.black,
                      )),
                    )
                  : const CircularProgressIndicator(),
              snapshot.hasData
                  ? Text(snapshot.data!.id.toString())
                  : Container(),
            ],
          ),
        );

        if (snapshot.hasData) {
          final pokemon = snapshot.data!;
          return Scaffold(
            appBar: appBar,
            body: Column(
              children: [
                Container(),
                Text(
                    'Nome: ${pokemon.name}, Altura: ${pokemon.height}, Peso: ${pokemon.weight}'),
                Image.network(
                  pokemon.sprites.officialArtwork,
                ),
                Text('id: ${pokemon.id}')
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: appBar,
            body: Text("${snapshot.error}"),
          );
        }
        return Scaffold(
          appBar: appBar,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
