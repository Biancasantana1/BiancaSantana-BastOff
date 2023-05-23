import 'package:aula11/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomButtonWidget(
        disable: false,
        onPressed: () {},
        title: 'Custom BTN',
        titleSize: 18,
      ),
    ));
  }
}
