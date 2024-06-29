import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final void Function() onPressedFunction;

  const CustomTextField({
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.onPressedFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        autofocus: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.secondaryColor
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: AppColors.tertiaryColor,
              width: 2
            )
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w400
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.tertiaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.add,
              color: AppColors.tertiaryColor,
            ),
            onPressed: onPressedFunction
          )
        ),
      ),
    );
  }
}