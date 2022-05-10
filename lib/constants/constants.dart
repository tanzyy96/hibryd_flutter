import 'package:flutter/material.dart';
import 'package:hibryd_flutter/models/daytask.dart';
import 'package:hibryd_flutter/my_flutter_app_icons.dart';

// Flutter colors are 0xAARRGGBB
class AppColors {
  static const primaryColor = Color(0xFFFB9B9B);
  static const secondaryColor = Color(0xFF4CBFAA);

  static const textPrimaryColor = Color(0xFF555555);
}

enum RemoteStatus {
  home,
  office,
  unavailable,
  leave,
  medical,
  none,
}

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
  TaskStatus.cancelled: Icon(
    Icons.cancel_outlined,
    color: Colors.red,
  ),
};
