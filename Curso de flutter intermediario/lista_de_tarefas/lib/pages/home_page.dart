import 'package:flutter/material.dart';
import '../controller/create_task_controller.dart';
import '../controller/home_page_controller.dart';
import '../model/task_model.dart';
import '../services/task_storage_service.dart';
import '../widgets/custom_create_task_widget.dart';
import '../widgets/custom_filter_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_task_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum TaskStatusFilter { all, done, notDone }

class _HomePageState extends State<HomePage> {
  final HomePageController _controller = HomePageController(
    taskStorage: TaskStorageService(),
  );

  void _toggleIcon() {
    setState(() {
      if (_controller.isEditingMode) {
        _controller.isEditingMode = false;
        _controller.isIconX = false;
      } else {
        _controller.isIconX = !_controller.isIconX;
      }
    });
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      _controller.toggleTaskStatus;
    });
    _controller.taskStorage.saveTasks(_controller.tasks);
  }

  @override
  void initState() {
    super.initState();
    _controller.taskStorage.loadTasks().then((loadedTasks) {
      setState(() {
        _controller.tasks = loadedTasks;
      });
    });
  }

  void _createTask(Task task, CreateTaskController controller) {
    _controller.updateTask(task, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 40,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Criar Tarefa',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          CustomHeaderWidget(
            isIconX: _controller.isIconX,
            isEditingMode: _controller.isEditingMode,
            onTap: _toggleIcon,
          ),
          SizedBox(
            height: 20,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0XFFD9EEFA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: _controller.isIconX
                  ? CustomCreateTaskWidget(
                      title:
                          'Crie uma nova tarefa preenchendo as informações do formulário abaixo:',
                      firstTextfield: 'Escreva sua Tarefa',
                      secondTextfield: 'Quando essa tarefa deve ser concluída?',
                      button: 'Criar Tarefa',
                      onTaskCreated: _createTask,
                      onButtonPressed: _toggleIcon,
                    )
                  : _controller.isEditingMode
                      ? CustomCreateTaskWidget(
                          title: 'Reescreva as informações',
                          firstTextfield: 'Escreva sua Tarefa',
                          secondTextfield:
                              'Quando essa tarefa deve ser concluída?',
                          button: 'Editar',
                          initialTask: _controller.editingTask,
                          onTaskCreated: (Task updatedTask,
                              CreateTaskController controller) {
                            _controller.updateTask(
                                updatedTask, _controller.editingIndex);
                            _controller.isEditingMode = false;
                          },
                          onButtonPressed: () {
                            setState(() {
                              _controller.isEditingMode = false;
                            });
                          },
                        )
                      : Column(
                          children: [
                            CustomFilterWidget(
                              statusFilter: _controller.statusFilter,
                              sortOrder: _controller.sortOrder,
                              onFilterSelected: (filter) {
                                setState(() {
                                  _controller.statusFilter = filter;
                                });
                              },
                              onSortOrderSelected: (order) {
                                setState(() {
                                  _controller.sortOrder = order;
                                  _controller.sortTasks();
                                });
                              },
                            ),
                            SafeArea(
                              child: Expanded(
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxHeight: 680),
                                  child: SingleChildScrollView(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      clipBehavior: Clip.none,
                                      padding: EdgeInsets.zero,
                                      itemCount: _controller.tasks.length,
                                      itemBuilder: (ctx, index) {
                                        Task task = _controller.tasks[index];
                                        if (_controller.statusFilter ==
                                                TaskStatusFilter.all ||
                                            (_controller.statusFilter ==
                                                    TaskStatusFilter.done &&
                                                _controller
                                                    .tasks[index].isDone) ||
                                            (_controller.statusFilter ==
                                                    TaskStatusFilter.notDone &&
                                                !_controller
                                                    .tasks[index].isDone)) {
                                          return CustomTaskItemWidget(
                                            task: task,
                                            deleteTask: (Task task) {
                                              setState(() {
                                                _controller.tasks.remove(task);
                                              });
                                            },
                                            toggleTaskStatus: (Task task) {
                                              setState(() {
                                                final taskIndex = _controller
                                                    .tasks
                                                    .indexWhere(
                                                        (t) => t == task);
                                                _controller.tasks[taskIndex]
                                                    .isDone = !task.isDone;
                                              });
                                            },
                                            onEdit: (Task task) {
                                              setState(() {
                                                _controller.isEditingMode =
                                                    true;
                                                _controller.editingTask = task;
                                                _controller.editingIndex =
                                                    index;
                                              });
                                            },
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
