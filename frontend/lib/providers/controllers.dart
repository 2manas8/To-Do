import 'package:flutter/material.dart';

class NewTaskControllers {
  static TextEditingController newTaskController = TextEditingController();
}

class CommonControllers {
  static void clearControllers() {
    NewTaskControllers.newTaskController.clear();
  }
}