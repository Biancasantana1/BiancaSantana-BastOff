import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefas/controller/home_page_controller.dart';
import 'package:lista_de_tarefas/interfaces/task_storage_interface.dart';
import 'package:lista_de_tarefas/model/task_model.dart';
import 'package:lista_de_tarefas/widgets/custom_filter_widget.dart';

class TaskStorageStub implements ITaskStorage {
  final List<Task> tasks;
  TaskStorageStub(this.tasks);

  @override
  Future<List<Task>> loadTasks() async {
    return tasks;
  }

  @override
  Future<void> saveTasks(List<Task> tasks) async {}
}

void main() {
  group('testando a HomePageController', () {
    late HomePageController controller;
    late List<Task> tasks;

    setUp(() {
      tasks = [
        Task(task: 'Task 1', date: '02/01/2023', isDone: false),
        Task(task: 'Task 2', date: '01/01/2023', isDone: false),
        Task(task: 'Task 3', date: '03/01/2023', isDone: true),
        Task(task: 'Task 4', date: 'Hoje', isDone: false),
        Task(task: 'Task 5', date: 'Amanhã', isDone: false),
      ];
      final storage = TaskStorageStub(tasks);
      controller = HomePageController(taskStorage: storage);
    });

    test('testando ordenação por data', () async {
      controller.sortOrder = TaskSortOrder.byDate;
      await controller.loadTasks();
      expect(controller.tasks[0].task, 'Task 4');
      expect(controller.tasks[1].task, 'Task 5');
      expect(controller.tasks[2].task, 'Task 2');
      expect(controller.tasks[3].task, 'Task 1');
      expect(controller.tasks[4].task, 'Task 3');
    });

    test('testando ordenação por status', () async {
      controller.sortOrder = TaskSortOrder.byStatus;
      await controller.loadTasks();
      expect(controller.tasks[0].task, 'Task 4');
      expect(controller.tasks[1].task, 'Task 5');
      expect(controller.tasks[2].task, 'Task 2');
      expect(controller.tasks[3].task, 'Task 1');
      expect(controller.tasks[4].task, 'Task 3');
    });

    test('testando a remoção de tarefa', () async {
      await controller.loadTasks();
      int taskCount = controller.tasks.length;
      controller.deleteTask(0);
      expect(controller.tasks.length, taskCount - 1);
    });

    test('testando a edição de tarefa', () async {
      await controller.loadTasks();
      int indexToEdit =
          controller.tasks.indexWhere((task) => task.task == 'Task 4');
      controller.startEditingMode(controller.tasks[indexToEdit], indexToEdit);
      controller.updateTask(
          Task(task: 'Task Edited', date: 'Hoje', isDone: false), indexToEdit);
      expect(controller.tasks[indexToEdit].task, 'Task Edited');
    });
  });
}
