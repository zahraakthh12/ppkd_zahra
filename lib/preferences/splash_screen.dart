import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas10Flutter/tugas10.dart';
import 'package:ppkd_zahra/Tugas11Flutter/drawer_tugas11.dart';
import 'package:ppkd_zahra/Tugas11Flutter/login_screen_furtopia.dart';
import 'package:ppkd_zahra/Tugas11Flutter/view/register_screen.dart';
import 'package:ppkd_zahra/Tugas9Flutter/constants.dart';
import 'package:ppkd_zahra/preferences/drawer_18.dart';
import 'package:ppkd_zahra/preferences/login_screen.dart';
import 'package:ppkd_zahra/preferences/preference_handler.dart';

class SplashScreenDay18 extends StatefulWidget {
  const SplashScreenDay18({super.key});

  @override
  State<SplashScreenDay18> createState() => _SplashScreenDay18State();
}

class _SplashScreenDay18State extends State<SplashScreenDay18> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DrawerTugas11()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenDay18()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.girl)),
          Text(
            "Waiting Room!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}