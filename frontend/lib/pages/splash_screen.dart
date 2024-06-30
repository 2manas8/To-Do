import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/widgets/splash_screen_image.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  State<SplashScreenPage> createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        splashScreenDuration,
            () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: toDoRoute)
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenImage(),
      backgroundColor: AppColors.splashScreenBackgroundColor,
    );
  }
}