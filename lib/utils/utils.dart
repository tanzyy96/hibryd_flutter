import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';

class StatusUI {
  Color color = const Color(0xFF555555);
  String? label;

  StatusUI(this.color, [this.label]);
}

StatusUI getStatusUI(RemoteStatus status) {
  switch (status) {
    case RemoteStatus.office:
      return StatusUI(const Color(0xFFF9FB9B), 'office 🏢.');
    case RemoteStatus.home:
      return StatusUI(const Color(0xFFFB9B9B), 'home 🏠.');
    // TODO: update colors for unavailable and medical and leave
    default:
      return StatusUI(const Color(0xFF555555));
  }
}
