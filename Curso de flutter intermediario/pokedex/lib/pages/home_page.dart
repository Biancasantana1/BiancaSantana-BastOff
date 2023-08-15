import 'package:flutter/material.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';
import 'package:provider/provider.dart';
import '../controller/pokemon_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  late final PokemonController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<PokemonController>(context, listen: false);
    controller.loadMorePokemon();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !controller.isLoading) {
      controller.loadMorePokemon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: ListView.builder(
            controller: _scrollController,
            itemCount: controller.pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = controller.pokemonList[index];
              return ListTile(
                title: Text('Nome: ${pokemon.name}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailsPage(url: pokemon.url),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
