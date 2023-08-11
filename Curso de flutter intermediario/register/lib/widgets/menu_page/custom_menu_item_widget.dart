import 'package:flutter/material.dart';

class CustomMenuItemWidget extends StatelessWidget {
  final String title;
  final IconData? trailingIcon;
  final VoidCallback onTap;

  const CustomMenuItemWidget({
    super.key,
    required this.title,
    this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0XFF040908),
          ),
        ),
        trailing: Icon(
          trailingIcon,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}
