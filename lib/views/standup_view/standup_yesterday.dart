import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/models/daytask.dart';
import 'package:hibryd_flutter/views/standup_view/standup_today.dart';

class StandupYesterday extends StatefulWidget {
  const StandupYesterday({Key? key}) : super(key: key);

  @override
  State<StandupYesterday> createState() => _StandupYesterdayState();
}

class _StandupYesterdayState extends State<StandupYesterday> {
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

    void _goNextPage() {
      final List<Task> pushedTasks = ystTasks.tasks
          .where((task) => task.taskStatus == TaskStatus.pushed)
          .toList(growable: false);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              StandupToday(todayTasks: pushedTasks, ystTasks: ystTasks.tasks),
        ),
      );
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
              onPressed: _isCompleted() ? null : _goNextPage,
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
