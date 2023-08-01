import 'package:flutter/material.dart';
import 'package:login/component/custom_text_component.dart';
import 'package:login/firebase_auth/auth_result.dart';
import 'package:login/firebase_auth/custom_firebase_auth.dart';
import 'package:login/page/sign_up_page.dart';
import '../component/custom_button_component.dart';
import '../component/custom_text_button_component.dart';
import '../component/custom_text_title_component.dart';
import '../utils/assets_images_utils.dart';
import '../component/custom_textfield_component.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.39),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 153,
                    ),
                    const CustomTextTitleComponent(
                      title: 'Fazer login',
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    const CustomTextComponent(
                      text: 'E-mail',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFieldComponent(
                      controller: emailController,
                      hintText: "ex. eduardo@gmail.com",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomTextComponent(text: 'Senha'),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFieldComponent(
                      controller: passwordController,
                      hintText: "************",
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonComponent(
                      text: 'Entrar na minha conta',
                      onPressedFunction: () async {
                        AuthResult result = await CustomFirebaseAuth().login(
                          email: emailController.text,
                          pass: passwordController.text,
                        );

                        if (!result.isSucess) {
                          setState(() {
                            errorMessage =
                                result.msgError ?? 'Erro desconhecido';
                          });
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                    ),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextButtonComponent(
                      text: 'Não tenho conta',
                      onPressedFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetsImg.vectorSecond,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
