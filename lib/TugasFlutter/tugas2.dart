import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Profil Lengkap", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: const Color.fromARGB(255, 179, 118, 111)),
      backgroundColor: const Color.fromARGB(255, 223, 211, 223),
      body: 
      Column(
        children: [

          Expanded(child: Container(
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/girl.jpg")),
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

// Baris 1: Menampilkan Nama Lengkap
              Text("Zahra Khotimah", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.brown),
              ),
              Text("Informasi:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, height: 2),)
            ]
          ),

// Baris 2: Menampilkan email
          Padding(
            padding: const EdgeInsets.only(left:50.0, right: 50.0),
            child: Container(
              decoration: 
              BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 179, 141, 138)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.email),
              SizedBox(width: 20),
              Text("zahraa.khotimah@gmail.com"),
            ],)
          )),

// Baris 3: Menampilkan nomor telepon
          Padding(padding: const EdgeInsets.all(20.0),
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_android),
              // Spacer(),
              Text("0857-1054-6602"),
            ],)),

// Baris 4: Menampilkan Kotak Postingan dan Followers
          Row(
            spacing: 15,
            children:[
            Expanded(child: Container(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 197, 173, 166),
              borderRadius: BorderRadius.circular(8),
              ),
              padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                Text("200"),
                Text("Postingan")
              ],)
              ),
              ),
            Expanded(child: Container(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 170, 138, 128),
              borderRadius: BorderRadius.circular(8),
              ),
              padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                Text("200k"),
                Text("Followers"),
              ],)
              ),
              ),

              
          ]),

// Baris 5: Tampilkan Deskripsi Profil
          Padding(
            padding:const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Deskripsi Profil:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text("Saya adalah seorang fresh-graduate dari Program Studi Matematika di UIN Syarif Hidayatullah Jakarta. Saat ini sedang belajar di PPKD Jakarta Pusat, dengan kejuruan Mobile Programming.",
                style: TextStyle(fontSize:12),),
                SizedBox(height:20),
              ],)
            ),
          
// Baris 6: Dekorasi
          Container(
            padding: const EdgeInsets.only(left: 100, right: 100),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(colors: [const Color.fromARGB(255, 185, 172, 171), const Color.fromARGB(255, 174, 184, 192), const Color.fromARGB(255, 191, 206, 191)])),
              child: Text("Let's Connect!!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
        ],
      ),
    );
  }
}