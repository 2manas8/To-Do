import 'package:flutter/material.dart';
import 'package:frontend/services/to-do_services.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class TaskDisplay extends StatefulWidget {
  final String id;
  final String task;
  final bool done;
  final void Function() onPressedFunction;

  TaskDisplay({
    required this.id,
    required this.task,
    required this.done,
    required this.onPressedFunction
  });

  @override
  State<TaskDisplay> createState() => TaskDisplayState();
}

class TaskDisplayState extends State<TaskDisplay> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.done;
  }

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
            value: isChecked,
            onChanged: (bool? value) async {
              setState(() {
                isChecked = value!;
              });
              await ToDoApiCalls.taskComplete(widget.id);
            },
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
                decoration: isChecked ? TextDecoration.lineThrough : null,
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