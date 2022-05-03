import 'package:intl/intl.dart';

class Workweek {
  List<DateTime> weekdays = [];

  Workweek() {
    var now = DateTime.now();
    weekdays = [DateTime(now.year, now.month, now.day - (now.weekday - 1))];
    for (int i = 0; i < 4; i++) {
      weekdays.add(weekdays[i].add(const Duration(days: 1)));
    }
  }

  DateTime getDay(int index) {
    assert(index >= 0 && index <= 5);
    return weekdays[index];
  }

  List<DateTime> getDays() {
    return weekdays;
  }

  String getRangeString({String dateFormat = DateFormat.ABBR_MONTH_DAY}) {
    if (weekdays.isEmpty) return "-"; // technically not possible but idk
    return '${DateFormat(dateFormat).format(weekdays[0])} - ${DateFormat(dateFormat).format(weekdays[weekdays.length - 1])}';
  }
}
