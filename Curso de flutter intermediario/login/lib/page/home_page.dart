import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_auth/custom_firebase_auth.dart';
import 'package:login/page/login_page.dart';
import '../utils/assets_images_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? userName;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userName = user.displayName;
      setState(() {
        this.userName = userName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF672B71),
      ),
      body: Container(
        color: const Color(0xFFE1D5E3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Text(
                'Bem-vindo(a) ${userName ?? ""}!',
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF672B71),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  CustomFirebaseAuth().logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Color(0xFF672B71),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image.asset(
                    AssetsImg.animacao,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
