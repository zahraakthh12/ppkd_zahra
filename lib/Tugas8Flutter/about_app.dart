import 'package:flutter/material.dart';

class AbboutApp extends StatelessWidget {
  const AbboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: Text("Tentang Aplikasi", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.brown[200]),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
          Image(image: AssetImage("assets/images/furtopia.png")),
          SizedBox(height: 30),
          Text("Platform yang menyediakan layanan pet shop dan pet clinic dalam satu aplikasi. Dilengkapi dengan fitur edukasi perawatan hewan bagi pemilik hewan peliharaan.", 
          textAlign: TextAlign.justify,),
          Spacer(),
          Text("Zahra Khotimah"),
          Text("Versi 1.0")
        ],),
      )

    );
  }
}