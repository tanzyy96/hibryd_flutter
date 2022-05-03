import 'package:flutter/material.dart';
import 'package:hibryd_flutter/components/day_status.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/models/status.dart';
import 'package:hibryd_flutter/utils/utils.dart';
import 'package:hibryd_flutter/views/day_details.dart';

class WeekStatus extends StatelessWidget {
  const WeekStatus({Key? key, required this.weekdays}) : super(key: key);

  final List<DateTime> weekdays;

  @override
  Widget build(BuildContext context) {
    final statuses =
        weekdays.map((day) => Status(day, RemoteStatus.office)).toList();
    const dayTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    const dateTextStyle = TextStyle(fontSize: 18);

    void _goToDayDetails(BuildContext context, String tag, Status status) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DayDetails(
            heroTag: tag,
            status: status,
          ),
        ),
      );
    }

    return Column(
        children: List.generate(weekdays.length, (index) {
      final dayStatus = statuses[index];
      final heroTag = "dayStatus$index";
      final statusText =
          (getStatusUI(dayStatus.remoteStatus).label ?? '_____.');

      return Hero(
        tag: heroTag, // lets see if this works, though its a bit dirty
        child: DayStatus(
          statusText: statusText,
          dayStatus: dayStatus,
          dayTextStyle: dayTextStyle,
          dateTextStyle: dateTextStyle,
          onTap: () => _goToDayDetails(context, heroTag, dayStatus),
        ),
      );
    }));
  }
}
