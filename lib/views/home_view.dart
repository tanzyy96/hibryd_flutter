import 'package:flutter/material.dart';
import 'package:hibryd_flutter/components/nav_bar.dart';
import 'package:hibryd_flutter/views/landing_view.dart';
import 'package:hibryd_flutter/views/week_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  final List<Widget> _pages = [
    const WeekView(),
    const LandingView(), // TODO: temp view
    const WeekView(), // TODO: temp view
    const WeekView(), // TODO: temp view
  ];

  void setPageIndex(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar:
          NavBar(pageIndex: pageIndex, onChangeTab: setPageIndex),
    );
  }
}
