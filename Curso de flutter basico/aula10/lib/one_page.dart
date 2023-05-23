import 'package:aula10/two_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/twoPage',
            arguments: 'teste',
          );
        },
        child: Text('Ir para Segunda Page'),
      ),
    ));
  }
}
