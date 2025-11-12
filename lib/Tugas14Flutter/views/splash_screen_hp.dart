import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas14Flutter/views/houseselected.dart';

class SplashScreenHP extends StatefulWidget {
  const SplashScreenHP({super.key});

  @override
  State<SplashScreenHP> createState() => _SplashScreenHPState();
}

class _SplashScreenHPState extends State<SplashScreenHP>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animasi fade in logo
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Setelah beberapa detik, pindah ke halaman House Selection
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1200),
          pageBuilder: (_, __, ___) => const HouseSelectionScreen(),
          transitionsBuilder: (_, animation, __, child) {
            final fade = Tween(begin: 0.0, end: 1.0).animate(animation);
            return FadeTransition(opacity: fade, child: child);
          },
        ),
      );
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
      body: Stack(
        children: [
          // Gradasi Latar Belakang
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D0D0D), Color(0xFF1A472A)], // Slytherin vibes
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Konten Tengah: Logo + Teks
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo Hogwarts
                  Image.asset(
                    'assets/images/hogwarts.png',
                    height: 160,
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "Welcome to Hogwarts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cinzel',
                      shadows: [
                        Shadow(
                          color: Colors.greenAccent,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Every great witch or wizard starts here...",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Loading di bawah
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
