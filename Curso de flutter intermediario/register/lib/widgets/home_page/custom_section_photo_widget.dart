import 'package:flutter/material.dart';

import '../../component/custom_button_component.dart';

class CustomSectionPhotoWidget extends StatelessWidget {
  final String backgroundAsset;
  final List<TextSpan> textSpans;
  final String buttonText;
  final VoidCallback onPressed;
  final double height;
  final double width;

  const CustomSectionPhotoWidget({
    super.key,
    required this.backgroundAsset,
    required this.textSpans,
    required this.buttonText,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            backgroundAsset,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xFF282828),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 32,
          child: SizedBox(
            width: 311,
            height: 66,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                children: textSpans,
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.39,
          left: 32,
          child: CustomButtonComponent(
            onPressed: onPressed,
            text: buttonText,
            height: height,
            width: width,
          ),
        ),
      ],
    );
  }
}
