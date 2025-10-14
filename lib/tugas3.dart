import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      backgroundColor: Color(0xFF89A8B2)),
      backgroundColor: Color(0xFFE5E1DA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Soal 1
            Text("Formulir Pengguna", style: TextStyle(height:3, fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
            child: Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(color: Color(0xFFB3C8CF), borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  //Input Nama
                  Text("Nama", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      border: OutlineInputBorder(),
                      hintText: "Masukkan Nama Anda",
                    ),
                  ),
              
                  // Input Email
                  SizedBox(height: 10),
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      border: OutlineInputBorder(),
                      hintText: "Masukkan Email Anda",
                    ),
                  ),
              
                  // Input No. HP
                  SizedBox(height: 10),
                  Text("No. Handphone", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      border: OutlineInputBorder(),
                      hintText: "Masukkan No. Handphone Anda"
                    ),
                  ),
              
                  // Input Deskripsi
                  SizedBox(height: 10),
                  Text("Deskripsi", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(40.0),
                      border: OutlineInputBorder(),
                      hintText: "Masukkan Deskripsi Anda",
                    )
                  )
                ],),
            )),
        
            // Soal 2
            Text("Galeri Grid", style: TextStyle(height: 3, fontWeight: FontWeight.bold, fontSize: 20)),
            
            GridView.builder(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  decoration: BoxDecoration(color: Color(0xFFB3C8CF)),);
              },
              ),
        
          ],),
      )
    ); 
  }
}