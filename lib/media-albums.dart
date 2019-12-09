import 'package:flutter/material.dart';

class MediaAlbumsScreen extends StatefulWidget {
  MediaAlbumsScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateMediaAlbumsScreen();
  }
}

class StateMediaAlbumsScreen extends State<MediaAlbumsScreen> {
  List<String> appointments = ["Checkup", "EKG", "Ultrasound"];
  List<Image> images = [Image.asset("assets/images/o'hooligan.jpeg"), Image.asset("assets/images/o'hooligan.jpeg"), Image.asset("assets/images/o'hooligan.jpeg")];
  final TextEditingController appointmentController = TextEditingController();

  // Function to be called on click
void _onTileClicked(int index){
  showModalBottomSheet(context: context, builder: (builder) {
      return Container(
        child: Text('Hello From Modal Bottom Sheet'),
        padding: EdgeInsets.all(40.0),
      );
    });
}

// Get grid tiles
List<Widget> _getTiles(List<Image> iconList) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < iconList.length; i++) {
    tiles.add(new GridTile(
        child: new InkResponse(
          enableFeedback: true,
          child: FittedBox(
            child: iconList[i],
            fit: BoxFit.cover
          ),
          onTap: () => _onTileClicked(i),
        )
      ));
  }
  return tiles;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maggie's Albums")),
      body: new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: _getTiles(images),
      )
    );
  }
}