import 'package:flutter/material.dart';
import 'package:veterinario/widget/custom_search_widget.dart';
import 'package:veterinario/widget/custom_see_details_widget.dart';
import '../widget/custom_select_search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 12),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Hello, Human!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Manrope',
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: Color(0xff757EFA),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const CustomSeeDetailsWidget(),
            const CustomSearchWidget(),
            CustomSelectSearchWidget(),
          ],
        ),
      ),
    );
  }
}
