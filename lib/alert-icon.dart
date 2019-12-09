import 'package:flutter/material.dart';

// Thanks https://stackoverflow.com/questions/53474168/how-to-reduce-the-margin-between-leading-and-title-for-listtile-flutter
class AlertIcon extends StatelessWidget {
  int alertCount;

  AlertIcon(int alertCount) {
    this.alertCount = alertCount;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
                Icon(Icons.notifications),
                if (alertCount > 0) new Positioned(
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
                      alertCount.toString(),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]);
  }

}