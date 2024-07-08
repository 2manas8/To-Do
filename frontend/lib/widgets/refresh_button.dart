import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class RefreshButton extends StatelessWidget {
  final void Function() onPressedFunction;

  RefreshButton({
    required this.onPressedFunction
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressedFunction,
      icon: Icon(
        Icons.refresh,
        color: AppColors.secondaryColor,
      ),
    );
  }

}