import 'package:flutter/material.dart';
import 'package:hibryd_flutter/views/standup_new_view.dart';

class StandupView extends StatelessWidget {
  const StandupView({Key? key}) : super(key: key);

  void _startStandup(BuildContext context) {
    Navigator.of(context, rootNavigator: true).push(_createRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: TextButton(
          onPressed: () => _startStandup(context),
          child: const Text("Start"),
        )),
      ),
    );
  }
}

// For new screen transition from bottom upwards
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const NewStandupView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
