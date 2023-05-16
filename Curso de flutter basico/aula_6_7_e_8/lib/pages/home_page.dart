import 'package:aula_6_conhecendo_principais_widgets/pages/pageViwes/one_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Aula 7 - ​​​​​​​PageView Widget
  PageController _pageController = PageController();
  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    //Aula 6 - ​​​​​​​Conhecendo os principais Widgets
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('AppBar'),
        ),
        backgroundColor: Colors.green,
      ),
      // Aula 8 - Drawer widget
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Bianca'),
              accountEmail: Text('bianca@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text('B'),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(0);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavigationBar = 0;
                });
              },
            ),
            ListTile(
              title: Text('Item 2'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavigationBar = 1;
                });
              },
            ),
            ListTile(
              title: Text('Item 3'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavigationBar = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController, // Aula 7 - ​​​​​​​PageView Widget
        children: [
          OnePage(), // Aula 7 - ​​​​​​​PageView Widget
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          //Aula 7 - ​​​​​​​PageView Widget
          currentIndex: indexBottomNavigationBar,
          onTap: (int page) {
            setState(() {
              indexBottomNavigationBar = page;
            });
            _pageController.animateToPage(
              page,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          //Aula 6 - ​​​​​​​Conhecendo os principais Widgets
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_airport_outlined), label: 'Item 1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_airport_outlined), label: 'Item 2'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_airport_outlined), label: 'Item 3'),
          ]),
    );
  }
}
