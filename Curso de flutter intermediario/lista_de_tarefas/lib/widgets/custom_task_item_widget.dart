import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task_model.dart';
import 'custom_task_options_dialog_widget.dart';

class CustomTaskItemWidget extends StatefulWidget {
  final Task task;
  final Function deleteTask;
  final Function toggleTaskStatus;
  final Function onEdit;

  const CustomTaskItemWidget({
    super.key,
    required this.task,
    required this.deleteTask,
    required this.toggleTaskStatus,
    required this.onEdit,
  });

  @override
  State<CustomTaskItemWidget> createState() => _CustomTaskItemWidgetState();
}

class _CustomTaskItemWidgetState extends State<CustomTaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            key: ValueKey(widget.task),
            width: 360,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: null,
                        child: Text(
                          widget.task.isDone ? 'Feito' : 'A Fazer',
                          style: TextStyle(
                              color: widget.task.isDone
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomTaskOptionsDialogWidget(
                                task: widget.task,
                                onEdit: widget.onEdit,
                                onDelete: widget.deleteTask,
                              );
                            },
                          );
                        },
                        child: const Icon(Icons.grid_view_rounded,
                            color: Color(0XFF008DDC)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.task.task),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.task.date,
                        style: const TextStyle(
                          color: Color(0XFF4F4F4F),
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -22,
            right: 30,
            width: MediaQuery.of(context).size.width * 0.25,
            child: TextButton(
              onPressed: () => widget.toggleTaskStatus(widget.task),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  widget.task.isDone ? const Color(0xFF58B2E5) : Colors.blue,
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(widget.task.isDone ? 'Desfazer' : 'Concluir'),
            ),
          ),
        ],
      ),
    );
  }
}
