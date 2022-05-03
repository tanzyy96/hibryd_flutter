import 'package:hibryd_flutter/models/user.dart';

enum EventType {
  online,
  offline,
}

class Event {
  final String name;
  final EventType? type;
  final DateTime startTime;
  final Duration duration;
  List<User> participants;

  Event(this.name, this.type, this.startTime, this.duration, this.participants);
}
