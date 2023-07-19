import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefas/controller/create_task_controller.dart';
import 'package:lista_de_tarefas/model/task_model.dart';
import 'package:intl/intl.dart';

void main() {
  late CreateTaskController controller;

  setUp(() {
    controller = CreateTaskController();
  });

  tearDown(() {
    controller.dispose();
  });

  group('CreateTaskController Teste', () {
    test('teste de valor inicial', () {
      expect(controller.taskController.text, '');
      expect(controller.dateController.text, '');
    });

    test('teste isSameDay deve ter apenas 2 digitos', () {
      DateTime d1 = DateTime.now();
      DateTime d2 = DateTime.now();
      DateTime d3 = DateTime.now().add(const Duration(days: 1));
      expect(controller.isSameDay(d1, d2), true);
      expect(controller.isSameDay(d1, d3), false);
    });

    test('testando o método createTask', () {
      String task = 'Sample Task';
      String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
      controller.taskController.text = task;
      controller.dateController.text = date;
      Task t = controller.createTask();
      expect(t.task, task);
      expect(t.date, date);
      expect(t.isDone, false);
    });

    test('testando o método updateTask', () {
      String task = 'Sample Task';
      String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
      Task existingTask =
          Task(task: 'Old Task', date: 'Old Date', isDone: true);
      Task newTask = Task(task: task, date: date, isDone: false);
      Task updatedTask = controller.updateTask(existingTask, newTask);
      expect(updatedTask.task, task);
      expect(updatedTask.date, date);
      expect(updatedTask.isDone, false);
    });
  });
}
