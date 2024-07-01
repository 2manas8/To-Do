import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';

class SplashScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        child: Image.asset(logo)
      ),
    );
  }
}