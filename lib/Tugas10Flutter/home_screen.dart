import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas10Flutter/tugas10.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.name, required this.city});
  final String name;
  final String city;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const List<Widget> _widgetOptions = [
    RegistScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text("Thank you, ${widget.name} from ${widget.city} have registered.",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
      ],)
    );
  }
}