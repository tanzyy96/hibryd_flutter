import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';

class NewStandupView extends StatefulWidget {
  const NewStandupView({Key? key}) : super(key: key);

  @override
  State<NewStandupView> createState() => NewStandupViewState();
}

class NewStandupViewState extends State<NewStandupView> {
  String _buttonText = "";
  bool _isDisabled = true;

  final List<List<String>> emojis = [
    ['😊', "I'm happy!"],
    ['😂', "LOL"],
    ['🤣', "LMAO"],
    ['😍', "XOXOXO"],
    ['😴', "Where's my coffee..."],
    ['😫', "Mr. Stark, I don't feel so good..."],
  ];

  // On press emotion
  _onPress(index) {
    setState(() {
      _buttonText = emojis[index][1];
      _isDisabled = false;
    });
  }

  // On press submit
  _onSubmit() {}

  @override
  Widget build(BuildContext context) {
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
              child: Column(
            children: [
              const SizedBox(
                width: 300,
                child: Text(
                  "How am I feeling today?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              // Fake padding
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: emojis.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 20,
                      ),
                      child: OutlinedButton(
                        onPressed: () => _onPress(index),
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size.fromHeight(80),
                          backgroundColor: Colors.amber.shade100,
                        ),
                        child: Text(
                          emojis[index][0],
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _isDisabled ? null : _onSubmit,
                child: Text(_isDisabled ? "Choose One" : _buttonText,
                    style: const TextStyle(
                      fontSize: 18,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                ),
              )
            ],
          )),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
