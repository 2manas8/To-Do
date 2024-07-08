import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class NoTasksAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Container(
        alignment: Alignment.topCenter,
        child: Text(
          noTaskAvailableText,
          style: TextStyle(
            fontSize: 25.0,
            color: AppColors.primaryColor
          )
        ),
      ),
    );
  }

}