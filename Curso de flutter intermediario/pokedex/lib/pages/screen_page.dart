import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/pokemon_controller.dart';
import 'home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  late final PokemonController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<PokemonController>(context, listen: false);
    _loadData();
  }

  _loadData() async {
    await controller.loadMorePokemon();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Lottie.asset('assets/lottie/lottie.json'),
        ),
      ),
    );
  }
}
