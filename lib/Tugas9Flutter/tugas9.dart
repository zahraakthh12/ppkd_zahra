import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas9Flutter/list_model.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  int _selectedIndex = 0;
  static const List<String> _titles = [
  "List View List",
  "List View List Map",
  "List View Model",
];
  static const List<Widget> _widgetOptions = [

    ListviewListWidget(),
    ListviewListMapWidget(),
    ListviewListModelWidget(),
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
              title: Text("List View List"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list),
              title: Text("List View List Map"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.list),
              title: Text("List View Model"),
            ),
            Divider(),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}