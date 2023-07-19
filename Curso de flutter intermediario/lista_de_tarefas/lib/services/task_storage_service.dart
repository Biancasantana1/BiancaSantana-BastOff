import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../interfaces/task_storage_interface.dart';
import '../model/task_model.dart';

class TaskStorageService implements ITaskStorage {
  @override
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringTasks =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList('tasks', stringTasks);
  }

  @override
  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringTasks = prefs.getStringList('tasks');
    if (stringTasks != null) {
      return stringTasks
          .map((stringTask) => Task.fromJson(jsonDecode(stringTask)))
          .toList();
    } else {
      return [];
    }
  }
}
