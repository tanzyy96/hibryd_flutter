import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/models/status.dart';
import 'package:hibryd_flutter/utils/utils.dart';
import 'package:intl/intl.dart';

class WeekStatus extends StatelessWidget {
  const WeekStatus({Key? key, required this.weekdays}) : super(key: key);

  final List<DateTime> weekdays;

  @override
  Widget build(BuildContext context) {
    final statuses =
        weekdays.map((day) => DayStatus(day, RemoteStatus.office)).toList();
    const dayTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    const dateTextStyle = TextStyle(fontSize: 18);

    return Column(
        children: List.generate(weekdays.length, (index) {
      final dayStatus = statuses[index];
      final statusText =
          (getStatusUI(dayStatus.remoteStatus).label ?? '_____.');

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          height: 80,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEEEEEE)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(statusText, style: const TextStyle(fontSize: 16)),
                RichText(
                    text: TextSpan(
                        text: "I will be @ ",
                        style: DefaultTextStyle.of(context).style,
                        children: [
                      TextSpan(
                          text: statusText,
                          style: const TextStyle(
                              decoration: TextDecoration.underline)),
                    ])),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: getStatusUI(dayStatus.remoteStatus).color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          DateFormat(DateFormat.ABBR_WEEKDAY)
                              .format(dayStatus.date as DateTime),
                          style: dayTextStyle),
                      Text(
                          DateFormat(DateFormat.ABBR_MONTH_DAY)
                              .format(dayStatus.date as DateTime),
                          style: dateTextStyle)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
