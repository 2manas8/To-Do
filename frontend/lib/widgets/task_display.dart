import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class TaskDisplay extends StatefulWidget {
  final String id;
  final String task;
  final bool done;
  final void Function(bool?) onChangedFunction;
  final void Function() onPressedFunction;

  TaskDisplay({
    required this.id,
    required this.task,
    required this.done,
    required this.onChangedFunction,
    required this.onPressedFunction
  });

  @override
  State<TaskDisplay> createState() => TaskDisplayState();
}

class TaskDisplayState extends State<TaskDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Row(
        children: [
          Checkbox(
            value: widget.done,
            onChanged: widget.onChangedFunction,
            activeColor: AppColors.primaryColor,
            checkColor: AppColors.tertiaryColor,
          ),
          Expanded(
            child: Text(
              widget.task,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18.0,
                decoration: widget.done ? TextDecoration.lineThrough : null,
                decorationThickness: 2.0,
                decorationColor: AppColors.primaryColor
              ),
              maxLines: 1,
            ),
          ),
          IconButton(
            onPressed: widget.onPressedFunction,
            icon: Icon(
              Icons.delete,
              color: AppColors.primaryColor,
            )
          )
        ],
      ),
    );
  }
}