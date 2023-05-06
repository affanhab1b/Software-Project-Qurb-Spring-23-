import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/utils/global.dart';

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

  void navigationTap(int page) {
    pageController.jumpToPage(page);
  }

  void OnPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: OnPageChange,
      ),
      bottomNavigationBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _page == 0 ? Colors.blue : Colors.grey,
          ),
          label: '',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _page == 1 ? Colors.blue : Colors.grey,
          ),
          label: '',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: _page == 2 ? Colors.blue : Colors.grey,
          ),
          label: '',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: _page == 3 ? Colors.blue : Colors.grey,
          ),
          label: '',
          backgroundColor: Colors.blue,
        ),
      ], onTap: navigationTap),
    );
  }
}
