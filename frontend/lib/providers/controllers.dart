import 'package:flutter/material.dart';

class NewTaskControllers {
  static TextEditingController newTaskController = TextEditingController();
}

class TaskControllers {
  static bool isCheck = false;
}

class CommonControllers {
  static void clearControllers() {
    NewTaskControllers.newTaskController.clear();
  }
}