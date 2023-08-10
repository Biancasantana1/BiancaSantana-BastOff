import 'package:flutter/material.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final String foto;
  final String texto;
  final bool? password;
  final bool isTextLight;
  final TextEditingController? controller;
  final Color borderColor;
  final Color iconColor;
  final Function(String)? onSearchComplete;

  const CustomTextFieldComponent({
    super.key,
    required this.foto,
    required this.texto,
    this.password = false,
    this.isTextLight = false,
    this.controller,
    this.borderColor = const Color(0xFF00BC70),
    this.iconColor = const Color(0XFF753BC1),
    this.onSearchComplete,
  });

  @override
  Widget build(BuildContext context) {
    final hintTextStyle = TextStyle(
      color: const Color(0XFF040908),
      fontSize: 14,
      fontWeight: isTextLight ? FontWeight.w300 : FontWeight.w500,
    );

    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          border: Border.all(
            color: borderColor,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              foto,
              color: iconColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: password ?? false,
                decoration: InputDecoration(
                  hintText: texto,
                  hintStyle: hintTextStyle,
                  border: InputBorder.none,
                ),
                onEditingComplete: () =>
                    onSearchComplete?.call(controller?.text ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
