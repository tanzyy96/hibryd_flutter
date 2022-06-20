import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/models/daytask.dart';
import 'package:hibryd_flutter/my_flutter_app_icons.dart';

class StandupToday extends StatefulWidget {
  const StandupToday(
      {Key? key, required this.todayTasks, required this.ystTasks})
      : super(key: key);

  final List<Task> todayTasks;
  final List<Task> ystTasks;

  @override
  State<StandupToday> createState() => _StandupTodayState();
}

class _StandupTodayState extends State<StandupToday> {
  List<String> newTasks = [];

  void showModal(BuildContext ctx) {
    showModalBottomSheet<void>(
        context: ctx,
        isScrollControlled: true,
        builder: (context) {
          return TasksBottomSheet(tasks: newTasks, addNewTask: addNewTask);
        });
  }

  void addNewTask(String input) {
    setState(() {
      newTasks.add(input);
    });
  }

  @override
  void initState() {
    super.initState();
    newTasks = widget.todayTasks.map((task) => task.description).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Task> getOrderedTasks(List<Task> tasks) {
      List<Task> _otherTasks = [];
      List<Task> _pushedTasks = [];
      for (Task task in tasks) {
        if (task.taskStatus == TaskStatus.pushed) {
          _pushedTasks.add(task);
        } else {
          _otherTasks.add(task);
        }
      }
      return [..._pushedTasks, ..._otherTasks];
    }

    const Map<TaskStatus, Icon> greyedIconMap = {
      TaskStatus.incomplete: Icon(
        CustomIcons.okCircled,
        color: Colors.grey,
      ),
      TaskStatus.completed: Icon(
        CustomIcons.okCircled,
        color: Colors.grey,
      ),
      TaskStatus.pushed: Icon(
        Icons.fast_forward_rounded,
        color: AppColors.secondaryColor,
      ),
      TaskStatus.cancelled: Icon(
        Icons.cancel_outlined,
        color: Colors.grey,
      ),
    };

    // Layout
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 80,
          bottom: 20,
        ),
        child: Center(
            child: Column(children: [
          const SizedBox(
            width: 300,
            child: Text(
              "What am I doing today?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Column(
                            children: List.generate(newTasks.length, (index) {
                              return Row(
                                children: [
                                  iconMap[TaskStatus.pushed]!,
                                  const SizedBox(width: 12),
                                  Flexible(
                                      child: Text(newTasks[index],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ))),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Column(
                        children:
                            List.generate(widget.ystTasks.length, (index) {
                          var orderedTasks = getOrderedTasks(widget.ystTasks);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                greyedIconMap[orderedTasks[index].taskStatus]!,
                                const SizedBox(width: 12),
                                Flexible(
                                    child: Text(orderedTasks[index].description,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              orderedTasks[index].taskStatus ==
                                                      TaskStatus.pushed
                                                  ? null
                                                  : TextDecoration.lineThrough,
                                          color:
                                              orderedTasks[index].taskStatus ==
                                                      TaskStatus.pushed
                                                  ? AppColors.secondaryColor
                                                  : Colors.grey,
                                        ))),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () => showModal(context),
                child: Row(
                  children: const [
                    Icon(
                      Icons.add,
                      size: 16,
                    ),
                    Text("Add"),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  side: const BorderSide(
                    width: 2,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(newTasks);
                },
                child: const Text("Next"),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                ),
              ),
            ],
          )
        ])),
      )),
    );
  }
}

class TasksBottomSheet extends StatefulWidget {
  const TasksBottomSheet({Key? key, required tasks, required this.addNewTask})
      : initTasks = tasks,
        super(key: key);

  final List<String> initTasks;
  final ValueChanged<String> addNewTask;

  @override
  State<TasksBottomSheet> createState() => TasksBottomSheetState();
}

class TasksBottomSheetState extends State<TasksBottomSheet> {
  late List<String> _tasks;
  final TextEditingController textController = TextEditingController();
  @override
  void initState() {
    _tasks = widget.initTasks;
    super.initState();
  }

  void _addNewTasks(String newTask) {
    setState(() {
      widget.addNewTask(textController.text);
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Add New Tasks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) => Text(
                      _tasks[index],
                      key: UniqueKey(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                    labelText: "New Task",
                    hintText: "What's your task?",
                    border: OutlineInputBorder()),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _addNewTasks(textController.text),
                color: AppColors.primaryColor,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Done")),
            ],
          ),
        ],
      ),
    );
  }
}
