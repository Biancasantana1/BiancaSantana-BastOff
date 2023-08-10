import 'package:flutter/material.dart';
import 'package:register/pages/home_page.dart';
import '../utils/assets_images_utils.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0XFF00BC70),
        body: Center(
          child: Image.asset(
            AssetsImg.register,
            fit: BoxFit.none,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
