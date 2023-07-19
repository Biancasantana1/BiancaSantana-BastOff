import '../model/task_model.dart';

abstract class ITaskStorage {
  Future<List<Task>> loadTasks();
  void saveTasks(List<Task> tasks);
}
