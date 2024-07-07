import 'package:flutter/material.dart';

class NewTaskControllers {
  static TextEditingController newTaskController = TextEditingController();
}

class FetchTaskControllers {
  static bool isFetchingTasks = false;
}

class CommonControllers {
  static void clearControllers() {
    NewTaskControllers.newTaskController.clear();
  }
}