import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const CustomSearchWidget({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.search_rounded,
            size: 16,
          ),
          hintText: 'Procurar',
          hintStyle: TextStyle(
            fontSize: 10,
          ),
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        onChanged: onSearch,
      ),
    );
  }
}
