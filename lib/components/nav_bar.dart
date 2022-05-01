import 'package:flutter/material.dart';
import 'package:hibryd_flutter/constants/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.pageIndex,
    required this.onChangeTab,
  }) : super(key: key);

  final int pageIndex;
  final Function(int) onChangeTab;

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> navBarItems = [
      // TODO: wrong icon for now
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.local_post_office,
          ),
          label: "Office"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.handshake_outlined,
          ),
          label: "Interactions"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_today,
          ),
          label: "Schedule"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.alternate_email,
          ),
          label: "Messages"),
    ];

    return BottomNavigationBar(
      currentIndex: pageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onChangeTab,
      items: navBarItems,
      // backgroundColor: const Color(0xFFE5E5E5),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}
