import 'package:flutter/material.dart';

import 'views/landing_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hibryd',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: const LandingView(),
    );
  }
}


