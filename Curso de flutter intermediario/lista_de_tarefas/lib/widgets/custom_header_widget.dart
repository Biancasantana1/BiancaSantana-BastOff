import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  final bool isIconX;
  final bool isEditingMode;
  final Function onTap;

  const CustomHeaderWidget({
    super.key,
    required this.isIconX,
    required this.isEditingMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue,
                  Colors.white,
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTap(),
            child: isIconX || isEditingMode
                ? Container(
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                : Container(
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
