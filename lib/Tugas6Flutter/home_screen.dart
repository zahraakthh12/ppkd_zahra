import 'package:flutter/material.dart';
import 'package:ppkd_zahra/tugas4.dart';
import 'package:ppkd_zahra/tugas5.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        // automaticallyImplyLeading: false,
        // leading: Icon(Icons.home),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Login"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Tugas4()),
                );
              },
              child: Text("Go To Tugas 4"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Tugas5()),
                  (route) => false,
                );
              },
              child: Text("Go To Tugas 5"),
            ),
          ),
        ],
      ),
    );
  }
}