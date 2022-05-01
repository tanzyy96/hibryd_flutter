import 'package:flutter/material.dart';
import 'package:hibryd_flutter/views/home_view.dart';
import 'views/landing_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Application routes
    final routes = {
      '/welcome': (context) => const LandingView(),
      '/my_week': (context) => const HomeView(),
    };

    return MaterialApp(
      title: 'hibryd',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const LandingView(),
      routes: routes,
    );
  }
}
