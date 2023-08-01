import 'package:flutter/material.dart';

class CustomTextComponent extends StatelessWidget {
  final String text;
  const CustomTextComponent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Dosis',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF672B71),
      ),
    );
  }
}
