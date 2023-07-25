import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veterinario/pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:veterinario/pages/splash_screen_page.dart';
import 'controller/filter_controller.dart';
import 'controller/scheduling_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<FilterController>(
            create: (_) => FilterController(),
          ),
          ChangeNotifierProvider<SchedulingController>(
            create: (_) => SchedulingController(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
