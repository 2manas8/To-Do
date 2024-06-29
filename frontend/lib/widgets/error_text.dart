import 'package:flutter/material.dart';
import 'package:frontend/providers/error_provider.dart';
import 'package:frontend/utils/colors.dart';

class ErrorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      ErrorProvider.errorMessage,
      style: TextStyle(
          color: AppColors.errorTextColor,
          fontSize: 15.0
      ),
    );
  }
}