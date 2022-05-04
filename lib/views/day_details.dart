import 'package:flutter/material.dart';
import 'package:hibryd_flutter/components/day_status.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/constants/styles.dart';
import 'package:hibryd_flutter/models/event.dart';
import 'package:hibryd_flutter/models/status.dart';
import 'package:hibryd_flutter/models/user.dart';
import 'package:hibryd_flutter/utils/utils.dart';
import 'package:intl/intl.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({Key? key, required this.heroTag, required this.status})
      : super(key: key);

  final String heroTag;
  final Status status;

  @override
  Widget build(BuildContext context) {
    // Mock data
    List<User> usersInOffice = [
      User("Nolan Christopher", null, null),
      User("Nicki Minaj", null, null),
      User("Miranda Lai Mis Koh", null, null),
    ];

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

    // Styles
    const dayTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    const dateTextStyle = TextStyle(fontSize: 18);

    // Methods

    final statusText = (getStatusUI(status.remoteStatus).label ?? '_____.');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day Details"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // fake padding
              // FIXME: when swapping, the text will suddenly turn red
              Hero(
                tag: heroTag,
                child: DayStatus(
                  statusText: statusText,
                  dayStatus: status,
                  dayTextStyle: dayTextStyle,
                  dateTextStyle: dateTextStyle,
                  onTap: null,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 20.0, bottom: 10, left: 8, right: 8),
                child: Text(
                  "Scheduled Events",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimaryColor,
                      fontSize: 16),
                ),
              ),
              Column(
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
                                "${event.name} @ $startTime",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const Icon(
                              Icons.meeting_room,
                            ), // TODO: should be an image set by event.type
                          ],
                        ),
                        UserAvatars(users: participants),
                      ],
                    ),
                  );
                }),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 10,
                endIndent: 10,
                color: Color(0xFFEEEEEE),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 0,
                  left: 8,
                  right: 8,
                ),
                child: Text(
                  "Who's In?",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimaryColor,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${usersInOffice.length} people",
                      style: const TextStyle(fontSize: 16),
                    ),
                    UserAvatars(users: usersInOffice),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserAvatars extends StatelessWidget {
  const UserAvatars({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;
  String getInitials(User user) {
    return user.name.trim().split(' ').map((l) => l[0]).take(2).join();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: users.length > 4 ? 4 : users.length,
        itemBuilder: (context, index) {
          return Align(
            widthFactor: 0.6,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.amberAccent,
                // TODO: handle the actual image
                child: Text(getInitials(users[index])),
              ),
            ),
          );
        },
      ),
    );
  }
}
