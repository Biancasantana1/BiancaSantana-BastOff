import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefas/model/task_model.dart';
import 'package:lista_de_tarefas/widgets/custom_task_options_dialog_widget.dart';

void main() {
  final Task task = Task(
    task: 'Tarefa simples',
    date: '01/01/2023',
    isDone: false,
  );

  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  testWidgets('CustomTaskOptionsDialogWidge teste de IU',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(
      child: CustomTaskOptionsDialogWidget(
        task: task,
        onEdit: (task) {},
        onDelete: (task) {},
      ),
    ));

    expect(find.byType(CustomTaskOptionsDialogWidget), findsOneWidget);
    expect(find.text('Editar Tarefa'), findsOneWidget);
    expect(find.text('Remover Tarefa'), findsOneWidget);
  });
}
