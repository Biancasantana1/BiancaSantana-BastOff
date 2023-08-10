import 'package:flutter/material.dart';

class CustomTextTitleComponent extends StatelessWidget {
  final String text;
  const CustomTextTitleComponent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0XFF040908),
            size: 20,
          ),
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0XFF040908),
            ),
          ),
        ),
      ],
    );
  }
}
