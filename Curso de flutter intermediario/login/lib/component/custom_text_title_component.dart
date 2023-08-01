import 'package:flutter/material.dart';

class CustomTextTitleComponent extends StatelessWidget {
  final String title;
  const CustomTextTitleComponent({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Madani',
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.black,
        height: 36 / 28,
      ),
    );
  }
}
