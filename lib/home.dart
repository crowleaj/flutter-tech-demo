import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello, Maggie!")),
      body: Column(
        children: <Widget>[
          Image.asset("assets/images/o'hooligan.jpeg"),
          SizedBox(
              height: 500,
              child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        leading: Icon(Icons.timeline),
                        title: Text("Appointments"),
                        onTap: () =>
                            Navigator.pushNamed(context, "/appointments"),
                      ),
                      ListTile(leading: Icon(Icons.palette), title: Text("Activities")),
                      ListTile(leading: Icon(Icons.image), title: Text("Pictures")),
                    ],
                  ).toList()))
        ],
      ),
    );
  }
}
