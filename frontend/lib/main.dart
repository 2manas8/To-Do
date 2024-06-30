import 'package:flutter/material.dart';
import 'package:frontend/pages/splash_screen.dart';
import 'package:frontend/pages/to-do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}