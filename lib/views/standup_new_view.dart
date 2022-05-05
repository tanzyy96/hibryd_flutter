import 'package:flutter/material.dart';

class NewStandupView extends StatefulWidget {
  const NewStandupView({Key? key}) : super(key: key);

  @override
  State<NewStandupView> createState() => NewStandupViewState();
}

class NewStandupViewState extends State<NewStandupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New"),
        backgroundColor: Colors.white,
        elevation: 0,
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
        child: Text("helo"),
      ),
      backgroundColor: Colors.white,
    );
  }
}
