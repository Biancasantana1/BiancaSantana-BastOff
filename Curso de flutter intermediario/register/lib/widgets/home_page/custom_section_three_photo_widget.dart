import 'package:flutter/material.dart';

import '../../component/custom_button_component.dart';

class CustomSectionThreePhotoWidget extends StatelessWidget {
  final String backgroundAsset;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomSectionThreePhotoWidget({
    super.key,
    required this.backgroundAsset,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            right: 32,
            left: 32,
            bottom: 32,
          ),
          height: MediaQuery.of(context).size.height * 0.25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              backgroundAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.width * 0.22,
          child: SizedBox(
            width: 259,
            height: 66,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: MediaQuery.of(context).size.width * 0.63,
          child: CustomButtonComponent(
            text: buttonText,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
