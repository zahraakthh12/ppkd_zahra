import 'package:flutter/material.dart';

class Tugas6 extends StatelessWidget {
  const Tugas6({super.key});

  @override
  Widget build(BuildContext context) {
    const String customFont = 'WorkSans';
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.only(top: 100.56, left: 21.4, right: 21.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey, Hello👋", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.09, fontFamily: customFont, color: Color(0xFF000000))),
            SizedBox(height: 5),
            Text("Enter your credentials to access your account", style: TextStyle(fontFamily: customFont, fontSize: 19.26)),

            Row(children: [Container(
              width: 417.21,
              decoration: BoxDecoration(color: Color(0xFF000000)),
            )],),

            SizedBox(height: 20),
            Text("Name", style: TextStyle(fontFamily: customFont, fontSize: 21.4)),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.7)),
              ),
            ),

            SizedBox(height: 20),
            Text("Email address", style: TextStyle(fontFamily: customFont, fontSize: 21.4)),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.7)),
                
              ),
            ),

            SizedBox(height: 20),
            Row(
              children: [
                Text("Password", style: TextStyle(fontFamily: customFont, fontSize: 21.4)),
                Spacer(),
                Text("Forgot password?", style: TextStyle(color: Color(0xFF0098FF), fontSize: 17.12))
              ],
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.remove_red_eye_rounded),
                contentPadding: EdgeInsets.all(2.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.7)),
              ),
            ),

            SizedBox(height: 20,),
            Row(children: [
              Icon(Icons.circle_outlined),
              Text(" I agree to the ", style: TextStyle(color: Color(0xFF777777), fontFamily: customFont, fontSize: 16.05)),
              Text("Terms & Privacy", style: TextStyle(color: Color(0xFF000000), fontFamily: customFont, fontSize: 16.05))
            ],),

            SizedBox(height: 20,),
            Container(
              width: 417.21,
              height: 48.14,
              decoration: BoxDecoration(color: Color(0xFF0098FF), borderRadius: BorderRadius.circular(10.7)),
              child: TextButton(onPressed: (){
                print("Log In");
              }, child: Text("Log In", style: TextStyle(fontFamily: customFont, fontSize: 21.74, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold))),
            ),

            SizedBox(height:20),
            Row(children: [
              Text("Don't have an account? ", style: TextStyle(color: Color(0xFF000000), fontFamily: customFont, fontSize: 19.26)),
              Text("Sign up", style: TextStyle(color: Color(0xFF0098FF), fontFamily: customFont, fontSize: 19.26, fontWeight: FontWeight.bold))
            ],),

            Column(
              children: [
              Text("© 2023 SO, All right Reserved", style: TextStyle(color: Color(0xFF777777), fontFamily: customFont))
            ],)


          ],
        ),
      )
    );
  }
}