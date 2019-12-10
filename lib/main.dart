import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/appointments/appointments.dart';
import 'package:hello_flutter/screens/login/login.dart';
import 'package:hello_flutter/oauth-service.dart';
import 'package:hello_flutter/screens/home/home.dart';

void main() {
  OAuthService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map<int, Color> primaryPalette = {
    50:Color(0xFFE9EAF6),
    100:Color(0xFFC8C9E9),
    200:Color(0xFFA5A7DA),
    300:Color(0xFF8284CA),
    400:Color(0xFF6968BF),
    500:Color(0xFF524DB3),
    600:Color(0xFF4c45a9),
    700:Color(0xFF443B9D),
    800:Color(0xFF3C3191),
    900:Color(0xFF301D7C),
  };

  Map<int, Color> secondaryPalette = {
    50:Color(0xFFE9E8F7),
    100:Color(0xFFC7C5EB),
    200:Color(0xFFA29FDD),
    300:Color(0xFF7E7ACF),
    400:Color(0xFF645CC4),
    500:Color(0xFF4E3FB5),
    600:Color(0xFF4836AB),
    700:Color(0xFF402C9F),
    800:Color(0xFF392193),
    900:Color(0xFF2D087D),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.light,
        primaryColor: MaterialColor(0xff4c45a9, primaryPalette),
        accentColor: MaterialColor(0xFFA29FDD, secondaryPalette),
        primarySwatch: MaterialColor(0xff4c45a9, primaryPalette),
        fontFamily: 'Maven Pro',
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => HomeScreen(),
        '/appointments': (context) => AppointmentsScreen(),
      },
    );
  }
}