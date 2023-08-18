import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';
import 'package:provider/provider.dart';
import '../controller/pokemon_controller.dart';
import '../widget/custom_appbar_widget.dart';
import '../widget/custom_search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late final PokemonController controller;
  bool isSorted = false;
  String iconText = '#';

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
    _searchController.dispose();
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
          appBar: AppBar(
            title: CustomAppbarWidget(
              isSorted: isSorted,
              iconText: iconText,
              onTapSort: () {
                setState(() {
                  isSorted = !isSorted;
                  iconText = isSorted ? 'A\nZ' : '#';
                });
                if (isSorted) {
                  controller.sortPokemon();
                } else {
                  controller.loadMorePokemon();
                }
              },
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              right: 24,
              left: 24,
            ),
            child: Column(
              children: [
                CustomSearchWidget(
                  searchController: _searchController,
                  onSearch: (value) {
                    controller.searchPokemon(value);
                  },
                ),
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: controller.pokemonList.length +
                        (controller.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      final pokemon = controller.pokemonList[index];
                      final color = pokemon.color ?? Colors.grey;
                      if (index == controller.pokemonList.length) {
                        return Center(
                          child: controller.isLoading
                              ? SizedBox(
                                  width: 50,
                                  height: 50,
                                  child:
                                      Lottie.asset('assets/lottie/lottie.json'),
                                )
                              : Container(),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailsPage(url: pokemon.url),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: color,
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '#${pokemon.id}',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0,
                                    color: color,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Image.network(
                                pokemon.imageUrl ?? '',
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.082,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: color,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  pokemon.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
