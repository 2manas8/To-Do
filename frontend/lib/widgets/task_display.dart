import 'package:flutter/material.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class TaskDisplay extends StatefulWidget {
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
            value: TaskControllers.isCheck,
            onChanged: (bool? value) {
              setState(() {
                TaskControllers.isCheck = value!;
              });
            },
            activeColor: AppColors.primaryColor,
            checkColor: AppColors.tertiaryColor,
          ),
          Expanded(
            child: Text(
              'Text',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18.0,
                decoration: TaskControllers.isCheck ? TextDecoration.lineThrough : null,
                decorationThickness: 2.0,
                decorationColor: AppColors.primaryColor
              ),
              maxLines: 1,
            ),
          ),
          IconButton(
            onPressed: (){
              print('Task deleted');
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.primaryColor,
            ))
        ],
      ),
    );
  }
}