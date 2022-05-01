import 'package:hibryd_flutter/constants/constants.dart';

class DayStatus {
  DateTime? date;
  RemoteStatus remoteStatus = RemoteStatus.none;

  DayStatus(DateTime currDate, this.remoteStatus) {
    date = currDate;
  }
}
