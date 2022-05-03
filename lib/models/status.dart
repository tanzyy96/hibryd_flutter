import 'package:hibryd_flutter/constants/constants.dart';

class Status {
  DateTime? date;
  RemoteStatus remoteStatus = RemoteStatus.none;

  Status(DateTime currDate, this.remoteStatus) {
    date = currDate;
  }
}
