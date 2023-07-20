import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.05,
          MediaQuery.of(context).size.height * 0.025,
          MediaQuery.of(context).size.width * 0.05,
          0),
      height: 60.0,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF6F6F6),
          hintText: 'Find best vaccinate, treatment...',
          hintStyle: const TextStyle(
            color: Color(0xffCACACA),
            fontFamily: 'Manrope',
            fontSize: 12,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Image.asset(
              'assets/image/search.png',
              width: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }
}
