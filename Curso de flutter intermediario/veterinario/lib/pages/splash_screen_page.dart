import 'package:flutter/material.dart';
import 'package:veterinario/utils/assets_images_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            AssetsImg.background,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.3,
                    MediaQuery.of(context).size.height * 0.12,
                    MediaQuery.of(context).size.width * 0.3,
                    0),
                child: Image.asset(
                  AssetsImg.logo,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: 300,
                height: 110,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.height * 0.10,
                    MediaQuery.of(context).size.width * 0.2,
                    0),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Color(0XFFDEE1FE),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Helping you \nto keep ',
                        ),
                        TextSpan(
                          text: 'your bestie',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' stay healthy!',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.height * 0.02,
                    MediaQuery.of(context).size.width * 0.2,
                    0),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF757EFA).withOpacity(0.7)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/homePage');
                  },
                  child: const Text(
                    'Começar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
