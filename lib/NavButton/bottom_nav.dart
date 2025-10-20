import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas6Flutter/app_color.dart';
import 'package:ppkd_zahra/Tugas6Flutter/home_screen.dart';
import 'package:ppkd_zahra/tugas1.dart';
import 'package:ppkd_zahra/tugas4.dart';
import 'package:ppkd_zahra/tugas5.dart';

class BottomNavCustomDay15 extends StatefulWidget {
  const BottomNavCustomDay15({super.key});

  @override
  State<BottomNavCustomDay15> createState() => _BottomNavCustomDay15State();
}

class _BottomNavCustomDay15State extends State<BottomNavCustomDay15> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    Tugas1(),
    Tugas4(),
    Tugas5(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation")),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.brown,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.menu, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}