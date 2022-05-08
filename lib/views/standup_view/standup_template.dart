import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/models/event.dart';
import 'package:hibryd_flutter/models/user.dart';
import 'package:hibryd_flutter/views/day_details.dart';
import 'package:hibryd_flutter/views/standup_view/standup_yesterday.dart';
import 'package:intl/intl.dart';

class Template extends StatelessWidget {
  const Template({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data
    List<User> participants = [
      // TODO: figure out how to handle images in dart
      User("Jason Mraz", null, null),
      User("Miranda Lai Mis Koh", null, null),
      User("Nicki Minaj", null, null),
    ];
    List<Event> events = [
      Event("Meeting", EventType.online, DateTime(2022, 4, 1, 13, 30),
          const Duration(hours: 2), participants),
      Event("Birthday Party", EventType.online, DateTime(2022, 4, 1, 16, 30),
          const Duration(hours: 2), participants),
    ];

    void _goNext() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StandupHistory()));
    }

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 80,
          bottom: 40,
        ),
        child: Center(
            child: Column(children: [
          const SizedBox(
            width: 300,
            child: Text(
              "What's my schedule today?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      children: List.generate(events.length, (index) {
                        final event = events[index];
                        final startTime = DateFormat(DateFormat.HOUR_MINUTE)
                            .format(event.startTime);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Text(
                                      event.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Text(
                                      "@ $startTime",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              UserAvatars(users: participants),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _goNext,
                  child: Text("Next"),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ])),
      )),
    );
  }
}
