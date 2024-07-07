import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class TaskFetchingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      height: 100,
      width: 100,
      alignment: Alignment.topCenter,
      child: CircularProgressIndicator(
        color: AppColors.tertiaryColor,
      ),
    );
  }

}