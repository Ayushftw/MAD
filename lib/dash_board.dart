import 'package:Cricket_flutter_app/bmi.dart';
import 'package:Cricket_flutter_app/cricket_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

//This is the main screen where functionality of bottom navigation bar is defined

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index:
            _selectedIndex, //On selecting particular index, particular screen will be displayed.
        children: [
          //Here, we can only have 2 screens that are available in bottom navigation bar.
          CricketScreen(),
          Bmi()
        ],
      ),

      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        iconSize: 35,
        selectedFontSize: 17,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_cricket_rounded), label: 'Cricket Score'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight_outlined), label: 'BMI'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
