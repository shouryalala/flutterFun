import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_widget.dart';
import 'launcher_widget.dart';
import 'onboarding_widget.dart';
import 'login_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"YoYoApp",
      //home:Home(),
      home: SplashScreen(),
      routes: <String, WidgetBuilder> {
        '/launcher': (BuildContext context) => SplashScreen(),
        '/home': (BuildContext context) => Home(),
        '/onboarding':(BuildContext context) => OnboardingMainPage(),
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
