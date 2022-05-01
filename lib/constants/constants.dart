import 'package:flutter/material.dart';

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
