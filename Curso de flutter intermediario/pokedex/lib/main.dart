import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/pages/screen_page.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/pages/home_page.dart';
import 'controller/pokemon_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => PokemonController(),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const LoadingPage(),
    );
  }
}
