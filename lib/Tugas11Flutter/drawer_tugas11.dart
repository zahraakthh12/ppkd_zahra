import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas11Flutter/view/list_user.dart';
import 'package:ppkd_zahra/Tugas11Flutter/view/login_page.dart';
import 'package:ppkd_zahra/preferences/preference_handler.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int _selectedIndex = 0;
  static const List<String> _titles = [
  "Home",

];
  static const List<Widget> _widgetOptions = [
    ListUserPage(),
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
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