import 'package:flutter/material.dart';
import 'package:login/page/sign_up_page.dart';
import '../utils/assets_images_utils.dart';
import 'login_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0385,
              right: 0.0,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AssetsImg.vectorThree,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Olá, seja bem vindo ao nosso \nAPP. Entre e saiba mais',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Madani',
                      fontSize: 18,
                      color: Color(0xFF2D2D2D),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFE1D5E3),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Entrar na minha conta',
                        style: TextStyle(
                          fontFamily: 'Dosis',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF672B71),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height,
                    height: 55,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                          color: Color(0xFF672B71),
                        )),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(
                          fontFamily: 'Dosis',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF672B71),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  AssetsImg.vectorFive,
                ),
                Image.asset(
                  AssetsImg.vectorFour,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
