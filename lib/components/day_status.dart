import 'package:flutter/material.dart';
import 'package:hibryd_flutter/models/status.dart';
import 'package:hibryd_flutter/utils/utils.dart';
import 'package:intl/intl.dart';

class DayStatus extends StatelessWidget {
  const DayStatus({
    Key? key,
    required this.statusText,
    required this.dayStatus,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.onTap,
  }) : super(key: key);

  final String statusText;
  final Status dayStatus;
  final TextStyle dayTextStyle;
  final TextStyle dateTextStyle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
                RichText(
                    text: TextSpan(
                        text: "I will be @ ",
                        style: const TextStyle(color: Colors.black),
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
      ),
    );
  }
}
