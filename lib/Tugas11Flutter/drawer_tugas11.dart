import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas11Flutter/login_screen_furtopia.dart';
import 'package:ppkd_zahra/Tugas11Flutter/view/create_user.dart.dart';
import 'package:ppkd_zahra/Tugas8Flutter/about_app.dart';
import 'package:ppkd_zahra/Tugas9Flutter/list_model.dart';
import 'package:ppkd_zahra/preferences/preference_handler.dart';

class DrawerTugas11 extends StatefulWidget {
  const DrawerTugas11({super.key});

  @override
  State<DrawerTugas11> createState() => _DrawerTugas10State();
}

class _DrawerTugas10State extends State<DrawerTugas11> {
  int _selectedIndex = 0;
  static const List<String> _titles = [
  "Home",

];
  static const List<Widget> _widgetOptions = [
    AbboutApp(),
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
      appBar: AppBar(title: Text(_titles[_selectedIndex]), backgroundColor: Colors.brown[200],),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/girl.jpg"),
              ),
              title: Text("Zahra Khotimah"),
              subtitle: Text("Peserta PPKD"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.list),
              title: Text("Home"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreenDay18()),
                  (route) => false,
                );
              },
              leading: Icon(Icons.outbond),
              title: Text("LogOut"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}