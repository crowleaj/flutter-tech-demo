import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

// Thank you https://pusher.com/tutorials/login-ui-flutter
// https://flutter.dev/docs/cookbook/forms/text-field-changes
// https://flutterbyexample.com/forms-1-user-input/
class _LoginScreen extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var badCredentials = false;
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
        controller: emailController,
        decoration: InputDecoration(
            hintText: 'Enter email',
            fillColor: Colors.white,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final passwordField = TextField(
        controller: passwordController,
        decoration: InputDecoration(
            hintText: 'Enter password',
            fillColor: Colors.white,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final loginButton = SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: RaisedButton(
          child: Text('Login', style: TextStyle(fontSize: 20)),
          color: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(32.0)),
          onPressed: () {
            final email = emailController.text;
            final password = passwordController.text;

            if (email == "foo" && password == "bar") {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/home');
            } else {
              setState(() {
                badCredentials = true;
              });
            }
          },
        ));

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/ls-logo.png"),
                    Padding(
                        padding: EdgeInsets.only(top: 80.0, bottom: 5.0),
                        child: emailField),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: passwordField),
                    loginButton,
                    if (badCredentials)
                      Text("Invalid Username or Password",
                          style: TextStyle(color: Colors.red, fontSize: 16))
                  ],
                ))));
  }
}
