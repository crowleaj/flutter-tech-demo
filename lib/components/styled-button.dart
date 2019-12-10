import 'package:flutter/material.dart';

noop() {}

class StyledButton extends StatelessWidget {
  String text;

  Function onPressed;

  StyledButton({@required String text, void Function() onPressed = noop}) {
    this.text = text;
    this.onPressed = onPressed;
  }

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
