import 'package:flutter/material.dart';
import 'package:hello_flutter/components/styled-button.dart';

class HomePage extends StatelessWidget {
  List<String> events;

  HomePage(List<String> events) {
    this.events = events;
  }

  @override
  Widget build(BuildContext context) {
    Widget picturesVideoContent = Column(children: [
      Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(border: Border.all()),
          child: Image.asset("assets/images/o'hooligan.jpeg")),
      Align(
          alignment: Alignment.bottomLeft,
          child: StyledButton(text: "Pictures & Videos"))
    ]);

    Widget eventBuilder = ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(8), child: Text(events[index]));
        });

    Widget eventContent = Column(children: <Widget>[
      Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Text("What's Next", style: TextStyle(fontSize: 20)))),
      Padding(
        child: Column(children: [
          SizedBox(height: 100, child: eventBuilder),
          Align(
              alignment: Alignment.bottomLeft,
              child: StyledButton(
                text: "Calendar",
                onPressed: () => Navigator.pushNamed(context, "/appointments"),
              ))
        ]),
        padding: EdgeInsets.only(left: 20, right: 20),
      )
    ]);

    return ListView(
        children: ListTile.divideTiles(
      context: context,
      tiles: [
        Card(
            child: Padding(
                padding: EdgeInsets.all(10), child: picturesVideoContent)),
        Card(
          child: eventContent,
        ),
        Card(
            child: ListTile(
                leading: Icon(Icons.palette), title: Text("Activities"))),
        Card(
            child:
                ListTile(leading: Icon(Icons.image), title: Text("Pictures"))),
      ],
    ).toList());
  }
}
