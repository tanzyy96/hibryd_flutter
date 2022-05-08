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
  @override
  Widget build(BuildContext context) {
    // Mock data
    final ystDate = DateTime.now().subtract(const Duration(days: 1));
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
    };

    DayTask ystTasks = DayTask(ystDate, [
      Task(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum nunc id erat interdum, eget sagittis elit semper. Ut sed turpis lobortis lacus viverra rutrum imperdiet sed nunc. Proin hendrerit efficitur urna ut aliquam. Praesent semper turpis in dolor rhoncus, ac ornare lacus rutrum.",
          TaskStatus.incomplete),
      Task(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum nunc id erat interdum, eget sagittis elit semper. Ut sed turpis lobortis lacus viverra rutrum imperdiet sed nunc. Proin hendrerit efficitur urna ut aliquam. Praesent semper turpis in dolor rhoncus, ac ornare lacus rutrum.",
          TaskStatus.completed),
      Task(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum nunc id erat interdum, eget sagittis elit semper. Ut sed turpis lobortis lacus viverra rutrum imperdiet sed nunc. Proin hendrerit efficitur urna ut aliquam. Praesent semper turpis in dolor rhoncus, ac ornare lacus rutrum.",
          TaskStatus.pushed),
    ]);

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
                    return ListTile(
                      leading: iconMap[ystTasks.tasks[index].taskStatus],
                      title: Text(ystTasks.tasks[index].description),
                      // onTap
                    );
                  }),
            )
          ],
        )),
      ),
    ));
  }
}
