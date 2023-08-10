import 'package:flutter/material.dart';
import '../../component/custom_button_component.dart';

class CustomSectionSecondPhotoWidget extends StatelessWidget {
  final String backgroundAsset;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  final double textTopPosition;
  final double buttonTopPosition;

  const CustomSectionSecondPhotoWidget({
    super.key,
    required this.backgroundAsset,
    required this.text,
    required this.buttonText,
    required this.onPressed,
    required this.textTopPosition,
    required this.buttonTopPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 32,
          ),
          height: MediaQuery.of(context).size.height * 0.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              backgroundAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * textTopPosition,
          left: MediaQuery.of(context).size.width * 0.14,
          child: SizedBox(
            width: 250,
            height: 44,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * buttonTopPosition,
          left: MediaQuery.of(context).size.width * 0.14,
          child: CustomButtonComponent(
            text: buttonText,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
