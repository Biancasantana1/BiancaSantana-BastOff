import 'package:flutter/material.dart';

class CustomButtonComponent extends StatelessWidget {
  final String text;
  final Future<void> Function() onPressedFunction;

  const CustomButtonComponent({
    super.key,
    required this.text,
    required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF672B71),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
        ),
        onPressed: onPressedFunction,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
