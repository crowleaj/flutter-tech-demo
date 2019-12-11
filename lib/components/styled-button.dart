import 'package:flutter/material.dart';

import '../utils.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  StyledButton({@required this.text, this.onPressed = Utils.noop});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text),
      color: Theme.of(context).accentColor,
      shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(32.0)),
      onPressed: onPressed,
    );
  }
}
