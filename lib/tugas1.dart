import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 232, 239),
      appBar: AppBar(title: Text("Profil Saya", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: const Color.fromARGB(255, 201, 173, 197)),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center, //Paragraf dimulai dari paling atas
        crossAxisAlignment: CrossAxisAlignment.center, //Tulisan rata tengah
        children: [
          Text("Hai, nama saya", style: TextStyle(fontSize:20)
          ),
          
          Text("Zahra Khotimah", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.brown)
          ),
       
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            size: 30, color: Colors.red),
          
          Text("Kebayoran Lama, Jakarta Selatan", style: TextStyle(fontSize: 20)),
        ],
      ),

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Saya seorang pelajar yang sedang belajar Flutter di PPKD Jakarta Pusat.",
          style: TextStyle(fontSize: 10)),
        ],
      ),
        ],
      ),
    );
  }
}