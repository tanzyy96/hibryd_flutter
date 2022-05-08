import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/models/daytask.dart';
import 'package:hibryd_flutter/my_flutter_app_icons.dart';

class StandupHistory extends StatefulWidget {
  const StandupHistory({Key? key}) : super(key: key);

  @override
  State<StandupHistory> createState() => _StandupHistoryState();
}

class _StandupHistoryState extends State<StandupHistory> {
  DayTask ystTasks = DayTask(DateTime.now().subtract(const Duration(days: 1)), [
    Task(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum nunc id erat interdum, eget sagittis elit semper. Ut sed turpis lobortis lacus viverra rutrum imperdiet sed nunc. Proin hendrerit efficitur urna ut aliquam. Praesent semper turpis in dolor rhoncus, ac ornare lacus rutrum.",
        TaskStatus.incomplete),
    Task(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum nunc id erat interdum, eget sagittis elit semper. Ut sed turpis lobortis lacus viverra rutrum imperdiet sed nunc. Proin hendrerit efficitur urna ut aliquam. Praesent semper turpis in dolor rhoncus, ac ornare lacus rutrum.",
        TaskStatus.incomplete),
    Task(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum nunc id erat interdum, eget sagittis elit semper. Ut sed turpis lobortis lacus viverra rutrum imperdiet sed nunc. Proin hendrerit efficitur urna ut aliquam. Praesent semper turpis in dolor rhoncus, ac ornare lacus rutrum.",
        TaskStatus.incomplete),
  ]);

  @override
  Widget build(BuildContext context) {
    // Mock data
    const Map<TaskStatus, Icon> iconMap = {
      TaskStatus.incomplete: Icon(
        CustomIcons.okCircled,
        color: Colors.grey,
      ),
      TaskStatus.completed: Icon(
        CustomIcons.okCircled,
        color: Colors.green,
      ),
      TaskStatus.pushed: Icon(
        Icons.fast_forward_rounded,
        color: AppColors.secondaryColor,
      ),
      TaskStatus.cancelled: Icon(
        Icons.cancel_outlined,
        color: Colors.red,
      ),
    };

    // Methods
    bool _isCompleted() {
      return ystTasks.tasks
          .any((task) => task.taskStatus == TaskStatus.incomplete);
    }

    Future<bool> _onSwipeTask(DismissDirection direction, int index) async {
      Task task = ystTasks.tasks[index];
      switch (direction) {
        case DismissDirection.endToStart:
          setState(() {
            ystTasks.tasks[index] = Task(task.description, TaskStatus.pushed);
            // insert reason
          });
          break;
        case DismissDirection.startToEnd:
          setState(() {
            ystTasks.tasks[index] =
                Task(task.description, TaskStatus.cancelled);
          });
          // insert some
          break;
        default:
      }
      return false;
    }

    void toggleTaskCompletion(index) {
      setState(() {
        ystTasks.tasks[index] = Task(
            ystTasks.tasks[index].description,
            ystTasks.tasks[index].taskStatus == TaskStatus.completed
                ? TaskStatus.incomplete
                : TaskStatus.completed);
      });
    }

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 80,
          bottom: 40,
        ),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
                width: 300,
                child: Text(
                  "What did I finish yesterday?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                )),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                  itemCount: ystTasks.tasks.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => toggleTaskCompletion(index),
                      child: Dismissible(
                        key: Key(ystTasks.tasks[index].description),
                        confirmDismiss: (dir) => _onSwipeTask(dir, index),
                        background: Container(
                          color: Colors.red,
                          child: const Align(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: AppColors.secondaryColor,
                          child: const Align(
                            child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(Icons.fast_forward_outlined),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        child: ListTile(
                          leading: iconMap[ystTasks.tasks[index].taskStatus],
                          title: Text(ystTasks.tasks[index].description),
                          // onTap
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _isCompleted() ? null : () {},
              child: Text(_isCompleted() ? "Update Tasks" : "Next",
                  style: const TextStyle(
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
              ),
            )
          ],
        )),
      ),
    ));
  }
}
