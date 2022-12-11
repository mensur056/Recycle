import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  double iconWidth = 30;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          changeIndex(index);
        },
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_leaf.svg',
              width: iconWidth,
              color: currentIndex == 0 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_notification.svg',
              width: iconWidth,
              color: currentIndex == 1 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_recycle.svg',
              width: iconWidth,
              color: currentIndex == 2 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_profile.svg',
              width: iconWidth,
              color: currentIndex == 3 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_menu.svg',
              width: iconWidth,
              color: currentIndex == 4 ? Colors.green : Colors.grey,
            ),
          ),
        ]);
  }
}
