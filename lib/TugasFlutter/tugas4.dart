import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget{
  const Tugas4({super.key});

    @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromARGB(255, 185, 151, 158)),
      backgroundColor: Color.fromARGB(255, 245, 230, 236),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(15),
        children: [

            // Soal 1: Formulir Pengguna
            SizedBox(height: 10),
            Text("User Form", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    //Input Nama
                    Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.all(2.0),
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                
                    // Input Email
                    SizedBox(height: 10),
                    Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.all(2.0),
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                
                    // Input No. HP
                    SizedBox(height: 10),
                    Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        contentPadding: EdgeInsets.all(2.0),
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Phone Number",
                        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                
                    // Input Deskripsi
                    SizedBox(height: 10),
                    Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
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
              ),
            ),

              // Soal 2: Daftar Produk
            SizedBox(height: 20),
            Text("Product List", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center),

            // Produk 1
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/royalcanin.jpg"), height: 150),
                title: Text("Royal Canin 4kg", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                subtitle: Text("Rp650.000,00", style: TextStyle(fontSize: 12)),
                trailing: Icon(Icons.favorite, color: Colors.red),
              ),
            ),

            // Produk 2
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/whiskas.jpg"), height: 150),
                title: Text("Whiskas Pouch 80gr", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                subtitle: Text("Rp8.000,00", style: TextStyle(fontSize: 12)),
                trailing: Icon(Icons.favorite, color: Colors.red),
              ),
            ),

            // Produk 3
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/catchoize.jpg"), height: 150),
                title: Text("Cat Choize 800gr", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                subtitle: Text("Rp20.000,00", style: TextStyle(fontSize: 12)),
                trailing: Icon(Icons.favorite, color: Colors.red),
              ),
            ),

            // Produk 4
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/pasir.jpg"), height: 150),
                title: Text("Pasir Markotop 10 liter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                subtitle: Text("Rp60.000,00", style: TextStyle(fontSize: 12)),
                trailing: Icon(Icons.favorite, color: Colors.red),
              ),
            ),

            // Produk 5
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/pasir2.jpg"), height: 150),
                title: Text("Pasir Markotop Tofu 7 liter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                subtitle: Text("Rp70.000,00", style: TextStyle(fontSize: 12)),
                trailing: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
        ]
      )
      );
  }
}