import 'package:flutter/material.dart';

import 'package:recipe_ui/screen_home.dart';
import 'package:recipe_ui/screen_profile.dart';

import 'package:recipe_ui/screen_save.dart';
import 'package:recipe_ui/screen_search.dart';

class ScreenBottomNavigation extends StatefulWidget {
  ScreenBottomNavigation({super.key});

  @override
  State<ScreenBottomNavigation> createState() => _ScreenBottomNavigationState();
}

class _ScreenBottomNavigationState extends State<ScreenBottomNavigation> {
  final List _pages = [
    ScreenHome(),
    ScreenSearch(),
    ScreenSave(),
    ScreenProfile(),
  ];
  int _selectedindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.green,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black38,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.save,
                color: Colors.black38,
              ),
              label: 'Save'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black38,
              ),
              label: 'Profile'),
        ],
        currentIndex: _selectedindex,
        onTap: _onItemTapped,
      ),
    );
  }
}
