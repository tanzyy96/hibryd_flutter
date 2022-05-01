import 'package:flutter/material.dart';
import 'package:hibryd_flutter/components/week_status.dart';
import 'package:hibryd_flutter/constants/styles.dart';
import 'package:hibryd_flutter/utils/datetime.dart';

class WeekView extends StatefulWidget {
  const WeekView({Key? key}) : super(key: key);

  @override
  State<WeekView> createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  @override
  Widget build(BuildContext context) {
    final Workweek week = getWorkweek();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("This Week", style: AppTextStyles.headerStyle),
            Text(week.getRangeString(), style: AppTextStyles.subheaderStyle),
            WeekStatus(weekdays: week.weekdays),
          ],
        ),
      ),
    );
  }
}
