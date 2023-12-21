import 'package:flutter/material.dart';
import 'components/usertile.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: SafeArea(
        child: SplashScreen()
        )
      );
  }
}


