import 'package:flutter/material.dart';
import 'package:hello_flutter/styled-button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int _currentIndex = 0;
  List<String> events = [
    "10:30 AM    Silver Sneakers",
    "11:30 AM   Puzzle Time",
    "1:30 PM    Salon Appointment With Marge"
  ];

  String _alertCountText() {
    return 10.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello, Maggie!")),
      body: ListView(
          children: ListTile.divideTiles(
        context: context,
        tiles: [
          Card(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Image.asset("assets/images/o'hooligan.jpeg")),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: StyledButton(text: "Pictures & Videos"))
            ]),
          )),
          Card(
            child: Column(children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.all(5), child: Text("What's Next", style: TextStyle(fontSize: 20)))),
              Padding(
                child: Column(children: [
                  SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(events[index]));
                        },
                      )),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: StyledButton(text: "Calendar", onPressed: () => Navigator.pushNamed(context, "/appointments"),))
                ]),
                padding: EdgeInsets.only(left: 20, right: 20),
              )
            ]),
          ),
          Card(
              child: ListTile(
                  leading: Icon(Icons.palette), title: Text("Activities"))),
          Card(
              child: ListTile(
                  leading: Icon(Icons.image), title: Text("Pictures"))),
        ],
      ).toList()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Stack(children: [
                Icon(Icons.notifications),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      _alertCountText(),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]),
              title: Text("Alerts")),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_headline), title: Text("IDK")),
        ],
      ),
    );
  }
}
