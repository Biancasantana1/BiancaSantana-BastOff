import 'package:flutter/material.dart';
import '../controller/create_task_controller.dart';
import '../model/task_model.dart';

class CustomCreateTaskWidget extends StatefulWidget {
  final Function(Task, CreateTaskController) onTaskCreated;
  final Function onButtonPressed;
  final String title, firstTextfield, secondTextfield, button;
  final Task? initialTask;

  const CustomCreateTaskWidget({
    super.key,
    required this.onTaskCreated,
    required this.onButtonPressed,
    required this.title,
    required this.firstTextfield,
    required this.secondTextfield,
    required this.button,
    this.initialTask,
  });

  @override
  CustomCreateTaskWidgetState createState() => CustomCreateTaskWidgetState();
}

class CustomCreateTaskWidgetState extends State<CustomCreateTaskWidget> {
  late final CreateTaskController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CreateTaskController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0XFF008DDC),
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.firstTextfield,
              style: const TextStyle(
                color: Color(0XFF4F4F4F),
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _controller.taskController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.secondTextfield,
              style: const TextStyle(
                color: Color(0XFF4F4F4F),
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controller.dateController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              onTap: () {
                _controller.selectDate(context);
              },
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    final task = _controller.createTask();
                    widget.onTaskCreated(task, _controller);
                    widget.onButtonPressed();
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(130, 40)),
                  ),
                  child: Text(widget.button),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
