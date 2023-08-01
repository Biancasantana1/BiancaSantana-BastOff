import 'package:flutter/material.dart';
import 'package:login/page/start_page.dart';
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
            builder: (context) => const StartPage(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE1D5E3),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0385,
                right: 0.0,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  AssetsImg.vectorFirst,
                ),
              ),
            ),
            Column(
              children: const [
                Text(
                  'Oba!',
                  style: TextStyle(
                    fontFamily: 'Madani',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color(0xFF672B71),
                  ),
                ),
                Text(
                  'Seja bem vindo ao nosso APP.',
                  style: TextStyle(
                    fontFamily: 'Madani',
                    fontSize: 18,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              ],
            ),
            Image.asset(
              AssetsImg.animacao,
            ),
          ],
        ),
      ),
    );
  }
}
