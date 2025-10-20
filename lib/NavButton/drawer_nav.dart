import 'package:flutter/material.dart';
import 'package:ppkd_zahra/tugas4.dart';
import 'package:ppkd_zahra/tugas5.dart';

class DrawerWidgetDay15 extends StatefulWidget {
  const DrawerWidgetDay15({super.key});

  @override
  State<DrawerWidgetDay15> createState() => _DrawerWidgetDay15State();
}

class _DrawerWidgetDay15State extends State<DrawerWidgetDay15> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    Tugas4(),
    Tugas5(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/girl.jpg"),
              ),
              title: Text("Zahra"),
              subtitle: Text("Peserta PPKD"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.payment),
              title: Text("Payment"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}