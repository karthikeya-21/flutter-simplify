import 'dart:async';
import 'dart:convert';

import 'homescreen.dart';
import 'package:flutter/material.dart';
import '../components/logo.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    super.initState();
    Timer(
        Duration(seconds: 3),
            (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimplifyLogo(),
    );
  }
}