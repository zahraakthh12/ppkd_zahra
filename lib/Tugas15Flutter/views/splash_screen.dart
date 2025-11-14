import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas15Flutter/preferences/preference_handler.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/drawer_screen.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/login_screen.dart';
import 'package:ppkd_zahra/Tugas9Flutter/constants.dart';

class SplashScreenDay33 extends StatefulWidget {
  const SplashScreenDay33({super.key});

  @override
  State<SplashScreenDay33> createState() => _SplashScreenDay33State();
}

class _SplashScreenDay33State extends State<SplashScreenDay33>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    isLoginFunction();

    // SIMPLE ANIMATION
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  isLoginFunction() async {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();

      if (isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => DrawerScreenDay33()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => LoginScreenDay33()),
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffdfbfb),
              Color(0xffebedee),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image.asset(
                    AppImages.girl,
                    height: 120,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Tugas 15 Flutter",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
