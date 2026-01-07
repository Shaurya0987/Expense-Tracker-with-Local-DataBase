import 'package:expensetracker/Screens/AnalysticalsScreen.dart';
import 'package:expensetracker/Screens/DashBoard.dart';
import 'package:expensetracker/Screens/ProfileScreen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreens extends StatefulWidget {
  const BottomNavigationScreens({super.key});

  @override
  State<BottomNavigationScreens> createState() =>
      _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    Dashboard(),
    Analysticalsscreen(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: "Analytics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
