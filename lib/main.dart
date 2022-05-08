import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/views/day_details.dart';
import 'package:hibryd_flutter/views/home_view.dart';
import 'package:hibryd_flutter/views/standup_view/standup_new_view.dart';
import 'package:hibryd_flutter/views/standup_view.dart';
import 'views/landing_view.dart';

void main() {
  runApp(const MyApp());
}

// My Application Routes
class AppRoutes {
  static final routes = {
    '/welcome': (context) => const LandingView(),
    '/weekview': (context) => const HomeView(),
    '/standup': (context) => const StandupView(),
    '/standup/new': (context) => const NewStandupView(),
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hibryd',
      theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          textTheme:
              const TextTheme(bodyText1: TextStyle(color: Colors.black))),
      home: const LandingView(),
      routes: AppRoutes.routes,
    );
  }
}
