import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromARGB(255, 185, 151, 158)),
      backgroundColor: Color(0xFFF6F5F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Soal 1
            SizedBox(height: 10),
            Text("User Form", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
            Padding(padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 214, 208, 198), borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  //Input Nama
                  Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
              
                  // Input Email
                  SizedBox(height: 10),
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
              
                  // Input No. HP
                  SizedBox(height: 10),
                  Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Phone Number",
                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
              
                  // Input Deskripsi
                  SizedBox(height: 10),
                  Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(40.0),
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Description",
                      hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  )
                ],),
            )),
        
            // Soal 2
            SizedBox(height: 10),
            Text("Gallery Grid", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            
            // Menampilkan grid
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              children:
              List.generate(6, (index){
                return Container(alignment: Alignment.center,
                color: Color.fromARGB(255, 214, 208, 198),

                // Menambahkan teks di dalam kotak
                child: Stack(
                  children: [Text("Box ${index + 1}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),],
                ),);
              }),)
          ],),
      )
    ); 
  }
}