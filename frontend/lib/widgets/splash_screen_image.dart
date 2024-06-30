import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';

class SplashScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset(logo)
      ),
    );
  }
}