import 'package:flutter/material.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/services/to-do_services.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/custom_text_field.dart';
import 'package:frontend/widgets/custom_title.dart';
import 'package:frontend/widgets/error_text.dart';
import 'package:frontend/widgets/task_display.dart';

class ToDoPage extends StatefulWidget {
  @override
  State<ToDoPage> createState() => ToDoPageState();
}

class ToDoPageState extends State<ToDoPage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTitle(
            title: toDoText
          ),
          ErrorText(),
          CustomTextField(
            keyboardType: TextInputType.text,
            controller: NewTaskControllers.newTaskController,
            hintText: addTaskText,
            prefixIcon: Icons.edit,
            onPressedFunction: () async {
              await ToDoApiCalls.addTask(
                NewTaskControllers.newTaskController.text.toString()
              );
              setState(() {});
            },
          ),
          TaskDisplay()
        ],
      )
    );
  }
}