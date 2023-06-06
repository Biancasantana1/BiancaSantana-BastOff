import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.monetization_on_outlined,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Conversor de ',
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: 'moedas',
                            style: TextStyle(color: Colors.cyan)),
                      ],
                    ),
                  ),
                  Text(
                    'Toodoo - Desenvolvimento de Software',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
