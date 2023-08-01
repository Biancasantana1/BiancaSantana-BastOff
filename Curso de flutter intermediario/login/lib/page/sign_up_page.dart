import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/component/custom_text_component.dart';
import 'package:login/firebase_auth/auth_result.dart';
import 'package:login/firebase_auth/custom_firebase_auth.dart';
import 'package:login/utils/assets_images_utils.dart';
import '../component/custom_button_component.dart';
import '../component/custom_text_button_component.dart';
import '../component/custom_text_title_component.dart';
import '../component/custom_textfield_component.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
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
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.275),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 153,
                    ),
                    const CustomTextTitleComponent(
                      title: 'Criar uma conta',
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    const CustomTextComponent(
                      text: 'Nome e sobrenome*',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFieldComponent(
                      controller: nameController,
                      hintText: "ex. Eduardo Barros",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomTextComponent(
                      text: 'E-mail*',
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
                    const CustomTextComponent(
                      text: 'Criar senha*',
                    ),
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
                      text: 'Criar conta',
                      onPressedFunction: () async {
                        AuthResult result = await CustomFirebaseAuth().register(
                          name: nameController.text,
                          email: emailController.text,
                          pass: passwordController.text,
                        );

                        if (!result.isSucess) {
                          setState(() {
                            errorMessage =
                                result.msgError ?? 'Erro desconhecido';
                          });
                        } else {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(result.userId)
                              .set({
                            'name': nameController.text,
                            'email': emailController.text,
                          });
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
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
                      text: 'Já possuo conta',
                      onPressedFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
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
