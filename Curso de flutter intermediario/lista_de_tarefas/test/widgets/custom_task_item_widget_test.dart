import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefas/model/task_model.dart';
import 'package:lista_de_tarefas/widgets/custom_task_item_widget.dart';

void main() {
  final Task task =
      Task(task: 'Tarefa simples', date: '01/01/2023', isDone: false);

  testWidgets('CustomTaskItemWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTaskItemWidget(
          task: task,
          deleteTask: () {},
          toggleTaskStatus: () {},
          onEdit: () {},
        ),
      ),
    ));

    expect(find.text('Tarefa simples'), findsOneWidget);
    expect(find.text('01/01/2023'), findsOneWidget);
    expect(find.text('A Fazer'), findsOneWidget);
    expect(find.text('Concluir'), findsOneWidget);
    expect(find.byIcon(Icons.grid_view_rounded), findsOneWidget);
  });
}
