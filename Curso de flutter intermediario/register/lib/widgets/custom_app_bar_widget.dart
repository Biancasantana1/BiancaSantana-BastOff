import 'package:flutter/material.dart';
import '../pages/menu_page.dart';
import '../utils/assets_images_utils.dart';

class CustomAppBarWidget extends StatelessWidget {
  final bool showCloseIcon;

  const CustomAppBarWidget({
    super.key,
    this.showCloseIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 2.0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AssetsImg.registerSecond),
            GestureDetector(
              child: Icon(
                showCloseIcon ? Icons.close : Icons.menu,
                color: const Color(0xFF048A81),
                size: 25,
              ),
              onTap: () {
                if (showCloseIcon) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
