import 'package:flutter/material.dart';
import 'package:hello_flutter/components/alert-icon.dart';
import 'package:hello_flutter/screens/home/home-page.dart';
import 'package:hello_flutter/screens/home/menu-page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  List<String> events = [
    "10:30 AM    Silver Sneakers",
    "11:30 AM   Puzzle Time",
    "1:30 PM    Salon Appointment With Marge"
  ];

  int _alertCount() {
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello, Maggie!")),
      body: PageView(
          controller: pageController,
          children: [HomePage(events), MenuPage()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() {
          switch (index) {
            case 0:
              pageController.jumpToPage(0);
              break;
            case 1:
            // TODO: Show notifications
              break;
            case 2:
              pageController.jumpToPage(1);
              break;
          }
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: AlertIcon(_alertCount()), title: Text("Alerts")),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_headline), title: Text("IDK")),
        ],
      ),
    );
  }
}
