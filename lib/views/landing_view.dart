import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: COLORS.primaryColor,
    );

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 80.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "welcome\nback,\nLynda!",
                style: TextStyle(
                  fontSize: 44,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: const Text('GET IN HERE')),
                TextButton(
                    onPressed: () {}, child: const Text("Switch Account"))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
