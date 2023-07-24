import 'package:flutter/material.dart';
import '../controller/scheduling_controller.dart';
import '../pages/scheduling_confirmation_page.dart';
import '../utils/assets_images_utils.dart';

class CustomAppBarWidget extends StatelessWidget {
  final SchedulingController controller;

  const CustomAppBarWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hello, Human!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: 'Manrope',
            ),
          ),
          GestureDetector(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AssetsImg.shoppingBag,
                  color: const Color(0xff757EFA),
                  width: 24,
                  height: 24,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 12,
                  bottom: 12,
                  child: Container(
                    width: 13,
                    height: 15,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${controller.schedules.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SchedulingConfirmationPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
