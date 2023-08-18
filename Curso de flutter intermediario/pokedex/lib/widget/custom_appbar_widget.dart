import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class CustomAppbarWidget extends StatelessWidget {
  final bool isSorted;
  final String iconText;
  final Function onTapSort;

  const CustomAppbarWidget({
    super.key,
    required this.isSorted,
    required this.iconText,
    required this.onTapSort,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(width: 16),
              const Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => onTapSort(),
            child: Row(
              children: [
                Text(
                  iconText,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Icon(
                  Icons.arrow_downward_sharp,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
