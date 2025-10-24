import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas10Flutter/tugas10.dart';
import 'package:ppkd_zahra/Tugas8Flutter/about_app.dart';
import 'package:ppkd_zahra/Tugas9Flutter/list_model.dart';
import 'package:ppkd_zahra/preferences/login_screen.dart';
import 'package:ppkd_zahra/preferences/preference_handler.dart';
import 'package:ppkd_zahra/tugas4.dart';
import 'package:ppkd_zahra/tugas5.dart';

class DrawerWidget18 extends StatefulWidget {
  const DrawerWidget18({super.key});

  @override
  State<DrawerWidget18> createState() => _DrawerWidget18State();
}

class _DrawerWidget18State extends State<DrawerWidget18> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    ListviewListWidget(),
    ListviewListMapWidget(),
    ListviewListModelWidget(),
    AbboutApp()
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
              title: Text("Input Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewList Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewListMap Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewModel Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>RegistScreen()),
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