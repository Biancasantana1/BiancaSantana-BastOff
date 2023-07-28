import 'package:intl/intl.dart';
import '../firebase_messaging/custom_local_notification.dart';
import '../interfaces/task_storage_interface.dart';
import '../model/task_model.dart';
import '../pages/home_page.dart';
import '../widgets/custom_filter_widget.dart';
import 'create_task_controller.dart';

class HomePageController {
  bool isIconX = false;
  List<Task> tasks = [];
  TaskStatusFilter statusFilter = TaskStatusFilter.all;
  TaskSortOrder sortOrder = TaskSortOrder.byDate;
  bool isEditing = false;
  bool isEditingMode = false;
  Task? editingTask;
  int? editingIndex;
  late final CreateTaskController createTaskController;

  final ITaskStorage taskStorage;
  final CustomLocalNotification customLocalNotification =
      CustomLocalNotification();

  HomePageController({required this.taskStorage}) {
    loadTasks();
  }

  Future<List<Task>> loadTasks() async {
    tasks = await taskStorage.loadTasks();
    sortTasks();
    return tasks;
  }

  void saveTasks() {
    taskStorage.saveTasks(tasks);
  }

  void updateTask(Task task, [int? index]) {
    String action = "editada";
    if (index != null) {
      tasks[index] = task;
    } else {
      tasks.add(task);
      action = "criada";
    }
    sortTasks();
    isEditingMode = false;
    saveTasks();
    customLocalNotification.taskNotification(task, action: action);
  }

  void toggleTaskStatus(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    sortTasks();
    saveTasks();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  void startEditingMode(Task task, int index) {
    isEditingMode = true;
    editingTask = task;
    editingIndex = index;
  }

  void stopEditingMode() {
    isEditingMode = false;
  }

  void sortTasks() {
    if (sortOrder == TaskSortOrder.byDate) {
      tasks.sort((a, b) => dateComparator(a.date, b.date));
    } else {
      tasks.sort((a, b) => (a.isDone ? 1 : 0).compareTo(b.isDone ? 1 : 0));
    }
  }

  int dateComparator(String date1, String date2) {
    if (date1 == 'Hoje') {
      if (date2 == 'Hoje') return 0;
      return -1;
    } else if (date1 == 'Amanhã') {
      if (date2 == 'Hoje') return 1;
      if (date2 == 'Amanhã') return 0;
      return -1;
    } else if (date2 == 'Hoje' || date2 == 'Amanhã') {
      return 1;
    } else {
      final parsedDate1 = DateFormat('dd/MM/yyyy').parse(date1);
      final parsedDate2 = DateFormat('dd/MM/yyyy').parse(date2);
      return parsedDate1.compareTo(parsedDate2);
    }
  }
}
