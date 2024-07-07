import 'package:flutter/material.dart';
import 'package:frontend/models/tasks.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/services/to-do_services.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/custom_text_field.dart';
import 'package:frontend/widgets/custom_title.dart';
import 'package:frontend/widgets/error_text.dart';
import 'package:frontend/widgets/no_tasks_available.dart';
import 'package:frontend/widgets/refresh_button.dart';
import 'package:frontend/widgets/task_display.dart';
import 'package:frontend/widgets/task_fetching_indicator.dart';

class ToDoPage extends StatefulWidget {
  @override
  State<ToDoPage> createState() => ToDoPageState();
}

class ToDoPageState extends State<ToDoPage> {
  List<Task>? tasks;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actions: [
          RefreshButton(
            onPressedFunction: () {
              fetchTasks();
              setState(() {});
            }
          )
        ],
      ),
      backgroundColor: AppColors.primaryColor,
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
              fetchTasks();
            },
          ),
          Expanded(
            child: FetchTaskControllers.isFetchingTasks
            ? TaskFetchingIndicator()
            : tasks!.isEmpty
              ? NoTasksAvailable()
              : ListView.builder(
                itemCount: tasks!.length,
                itemBuilder: (context, index) {
                  final task = tasks![index];
                  return TaskDisplay(
                    id: task.id,
                    task: task.task,
                    done: task.done,
                    onPressedFunction: () async {
                      await ToDoApiCalls.deleteTask(task.id);
                      fetchTasks();
                    },
                  );
                }
              )
          )
        ],
      )
    );
  }

  void fetchTasks() async {
    FetchTaskControllers.isFetchingTasks = true;
    tasks = await ToDoApiCalls.getTask();
    FetchTaskControllers.isFetchingTasks = false;
    setState(() {});
  }
}