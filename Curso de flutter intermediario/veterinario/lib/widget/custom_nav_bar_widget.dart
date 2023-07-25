import 'package:flutter/material.dart';
import 'package:veterinario/utils/assets_images_utils.dart';

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({
    super.key,
  });

  @override
  CustomNavBarWidgetState createState() => CustomNavBarWidgetState();
}

class CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            _buildItem(
              icon: AssetsImg.home,
              label: 'Home',
              index: 0,
            ),
            _buildItem(
              icon: AssetsImg.heart,
              label: 'Favorites',
              index: 1,
            ),
            _buildItem(
              icon: AssetsImg.messageCircle,
              label: 'Messages',
              index: 2,
            ),
            _buildItem(
              icon: AssetsImg.user,
              label: 'Profile',
              index: 3,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF818AF9),
          unselectedItemColor: const Color(0xFF3F3E3F),
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Image.asset(
            icon,
            width: 24,
            color: _selectedIndex == index
                ? const Color(0xFF818AF9)
                : const Color(0xFF3F3E3F).withOpacity(0.3),
          ),
          const SizedBox(
            height: 3,
          ),
          if (_selectedIndex == index)
            Container(
              height: 2,
              width: 12,
              color: const Color(0xFF818AF9),
            ),
        ],
      ),
      label: label,
    );
  }
}
