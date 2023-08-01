import 'package:flutter/material.dart';

class CustomTextButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressedFunction;

  const CustomTextButtonComponent({
    super.key,
    required this.text,
    required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressedFunction,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            decoration: TextDecoration.underline,
            color: Color(0xFFB3B3B3),
          ),
        ),
      ),
    );
  }
}
