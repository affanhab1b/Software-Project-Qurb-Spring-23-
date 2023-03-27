import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Text('feed'),
          Text('search'),
          Text('add post'),
          Text('notif'),
          Text('profile'),
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _page == 0 ? blueColor : Colors.grey,
          ),
          label: '',
          backgroundColor: blueColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _page == 1 ? blueColor : Colors.grey,
          ),
          label: '',
          backgroundColor: blueColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: _page == 2 ? blueColor : Colors.grey,
          ),
          label: '',
          backgroundColor: blueColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: _page == 3 ? blueColor : Colors.grey,
          ),
          label: '',
          backgroundColor: blueColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: _page == 4 ? blueColor : Colors.grey,
          ),
          label: '',
          backgroundColor: blueColor,
        ),
      ], onTap: navigationTapped),
    );
  }
}
