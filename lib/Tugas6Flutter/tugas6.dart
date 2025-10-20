import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas6Flutter/custom_sign_in_widget.dart';
import 'package:ppkd_zahra/Tugas6Flutter/app_color.dart';
import 'package:ppkd_zahra/Tugas6Flutter/custom_text_field.dart';
import 'package:ppkd_zahra/Tugas6Flutter/home_screen.dart';

class Tugas6Flutter extends StatefulWidget {
  const Tugas6Flutter({super.key});

  @override
  State<Tugas6Flutter> createState() => _Tugas6FlutterState();
}

class _Tugas6FlutterState extends State<Tugas6Flutter> {
  static String customFont = 'WorkSans';
  bool showIconBulat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.only(left: 21.4, right: 21.4, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Bagian Salam
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hey, Hello 👋", 
                style: TextStyle(fontWeight: FontWeight.bold, 
                                fontSize: 32.09, 
                                fontFamily: customFont, 
                                color: AppColor.black00)),
                Text("Enter your credentials to access your account", 
                style: TextStyle(fontFamily: customFont, 
                                fontSize: 19, fontWeight: FontWeight.w600))
              ],
            ),

            // Bagian Sign In
            SizedBox(height: 30),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInWidget(customFont: customFont, image: "assets/images/google.png", text: "Google", press: "Menekan Google!"),
                SignInWidget(customFont: customFont, image: "assets/images/apple.png", text: "Apple", press: "Menekan Apple!"),
              ],),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 0.5, color: AppColor.greywhh)
                      ),
                      Text("or ", style: TextStyle(fontSize: 18, color: AppColor.grey77, fontFamily: customFont, fontWeight: FontWeight.bold),),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 0.5, color: AppColor.greywhh)
                      ),
                ],
              ),

            // Bagian Input
            SizedBox(height: 5),
            CustomTextField(title: "Name"),

            SizedBox(height: 10),
            CustomTextField(title: "Email address"),

            SizedBox(height: 10),
               CustomTextField(title: "Password", 
               isPassword: true,
                ),

            // Bagian Setuju/Agree
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              InkWell(
                onTap: (){
                  print("Show Icon: $showIconBulat");
                    showIconBulat = !showIconBulat;
                    setState(() {});
                },
                child: Icon(showIconBulat? Icons.circle_outlined : Icons.circle_sharp),
              ),
              Text(" I agree to the", style: TextStyle(fontFamily: customFont, fontSize: 15, color: AppColor.grey77)),
              TextButton(
                onPressed: (){
                  print("Menekan Terms & Privacy");
                },
                child: Text("Terms & Privacy", style: TextStyle(fontFamily: customFont, fontSize: 15, color: AppColor.black00, decoration: TextDecoration.underline, decorationColor: AppColor.black00, decorationThickness: 2))),
            ],),

            // Bagian Kotak Log In
            SizedBox(height: 10),
            Container(
              width: 417.21,
              height: 48.14,
              decoration: BoxDecoration(color: AppColor.blueFF, borderRadius: BorderRadius.circular(10.7)),
              child: TextButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
              }, child: Text("Log In", style: TextStyle(fontFamily: customFont, fontSize: 21.74, color: AppColor.whiteFF, fontWeight: FontWeight.bold))),
            ),
            
            // Bagian Sign Up
            SizedBox(height:10),
            Row(children: [
              Text("Don't have an account?", style: TextStyle(color: AppColor.black00, fontFamily: customFont, fontSize: 16, fontWeight: FontWeight.w600)),
              TextButton(
                onPressed: (){
                  print("Menekan Sign Up");
                },
                child: Text("Sign up", style: TextStyle(color: AppColor.blueFF, fontFamily: customFont, fontSize: 16, fontWeight: FontWeight.bold)))
            ],),

            // Bagian Credit
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("© 2023 SO, All right Reserved", style: TextStyle(color: AppColor.grey77, fontFamily: customFont, fontWeight: FontWeight.bold))
            ],)


          ],
        ),
      )
    );}
}