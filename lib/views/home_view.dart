import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hibryd_flutter/components/nav_bar.dart';
import 'package:hibryd_flutter/constants/constants.dart';
import 'package:hibryd_flutter/views/day_details.dart';
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

  final List<BottomNavigationBarItem> navBarItems = [
    // TODO: wrong icon for now
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.local_post_office,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.handshake_outlined,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.calendar_today,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.alternate_email,
      ),
    ),
  ];

  void onChangeTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: navBarItems,
        activeColor: AppColors.primaryColor,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return _pages[index];
          },
        );
      },
    );
  }
}
