import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/home_page.dart';

enum TaskSortOrder { byDate, byStatus }

class CustomFilterWidget extends StatelessWidget {
  final TaskStatusFilter statusFilter;
  final TaskSortOrder sortOrder;
  final Function(TaskStatusFilter) onFilterSelected;
  final Function(TaskSortOrder) onSortOrderSelected;

  const CustomFilterWidget({
    super.key,
    required this.statusFilter,
    required this.sortOrder,
    required this.onFilterSelected,
    required this.onSortOrderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Row(
        children: [
          const Text(
            'Tarefas',
            style: TextStyle(
              color: Color(0XFF008DDC),
              fontSize: 14,
            ),
          ),
          const Spacer(),
          PopupMenuButton<TaskSortOrder>(
            onSelected: onSortOrderSelected,
            itemBuilder: (context) {
              return <PopupMenuEntry<TaskSortOrder>>[
                const PopupMenuItem(
                  value: TaskSortOrder.byDate,
                  child: Text('Ordenar por Data'),
                ),
                const PopupMenuItem(
                  value: TaskSortOrder.byStatus,
                  child: Text('Ordenar por Status'),
                ),
              ];
            },
            child: const Text(
              'Ordenar',
              style: TextStyle(
                color: Color(0XFF008DDC),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(width: 20),
          PopupMenuButton<TaskStatusFilter>(
            onSelected: onFilterSelected,
            itemBuilder: (context) {
              return <PopupMenuEntry<TaskStatusFilter>>[
                const PopupMenuItem(
                  value: TaskStatusFilter.all,
                  child: Text('Todas as Tarefas'),
                ),
                const PopupMenuItem(
                  value: TaskStatusFilter.done,
                  child: Text('Tarefas Concluídas'),
                ),
                const PopupMenuItem(
                  value: TaskStatusFilter.notDone,
                  child: Text('Tarefas Não Concluídas'),
                ),
              ];
            },
            child: const Text(
              'Filtrar',
              style: TextStyle(
                color: Color(0XFF008DDC),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
