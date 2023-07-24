import 'package:flutter/material.dart';
import 'package:veterinario/utils/assets_images_utils.dart';

class CustomSearchWidget extends StatefulWidget {
  final Function(String) onSearch;

  const CustomSearchWidget({super.key, required this.onSearch});

  @override
  CustomSearchWidgetState createState() => CustomSearchWidgetState();
}

class CustomSearchWidgetState extends State<CustomSearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();

    super.dispose();
  }

  void _onSearchChanged() {
    widget.onSearch(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05,
        MediaQuery.of(context).size.height * 0.025,
        MediaQuery.of(context).size.width * 0.05,
        0,
      ),
      height: 60.0,
      child: TextField(
        controller: _searchController,
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
              AssetsImg.search,
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
