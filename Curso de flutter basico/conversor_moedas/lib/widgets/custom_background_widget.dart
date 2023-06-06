import 'package:flutter/material.dart';

class CustomBackgroundWidget extends StatelessWidget {
  final Widget child;

  const CustomBackgroundWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/img/imgFundoDinheiro.png',
              width: 400,
              height: 400,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
