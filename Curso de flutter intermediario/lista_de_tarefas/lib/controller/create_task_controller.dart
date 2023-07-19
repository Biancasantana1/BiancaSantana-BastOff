import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/task_model.dart';

class CreateTaskController {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      String formattedDate;
      final DateTime tomorrow = now.add(const Duration(days: 1));
      if (isSameDay(picked, now)) {
        formattedDate = 'Hoje';
      } else if (isSameDay(picked, tomorrow)) {
        formattedDate = 'Amanhã';
      } else {
        formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      }
      dateController.text = formattedDate;
    }
  }

  bool isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  Task createTask() {
    return Task(
      task: taskController.text,
      date: dateController.text,
      isDone: false,
    );
  }

  void dispose() {
    taskController.dispose();
    dateController.dispose();
  }

  Task updateTask(Task existingTask, Task newTask) {
    existingTask.task = newTask.task;
    existingTask.date = newTask.date;
    existingTask.isDone = newTask.isDone;
    return existingTask;
  }
}
