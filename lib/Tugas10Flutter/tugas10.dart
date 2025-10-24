import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas10Flutter/home_screen.dart';
import 'package:ppkd_zahra/Tugas6Flutter/app_color.dart';
import 'package:ppkd_zahra/Tugas6Flutter/custom_text_field.dart';
import 'package:ppkd_zahra/Tugas6Flutter/home_screen.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  static const id = "/login_screen17";

  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: Text("Flutter Class Registration Form", style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: const Color.fromARGB(255, 225, 208, 208)),
      body: Stack(children: [buildLayer()]));
  }

  final _formKey = GlobalKey<FormState>();
  SafeArea buildLayer(){
    return SafeArea(child:
    Form(key: _formKey,
    child: Padding(padding: const EdgeInsets.all(16.0),
    child: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Please fill out the following form carefully!", style: TextStyle(fontSize: 16)),

        height(20),
        buildTitle("Full Name"),
        height(10),
        buildTextField(
                  hintText: "Enter your full name",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),


        height(15),
        buildTitle("Email"),
        height(10),
        buildTextField(
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    } else if (!value.contains('@')) {
                      return "Invalid email";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                    ).hasMatch(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
        
        height(15),
        buildTitle("Phone Number"),
        height(10),
        buildTextField(
                  hintText: "Enter your phone number",
                  controller: phoneController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return null;
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)){
                      return "Phone number can only be numbers";
                    }
                    return null;
                  }),

        height(15),
        buildTitle("City Of Domicile"),
        height(10),
        buildTextField(
          hintText: "Enter your city of domicile",
          controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "City of domicile cannot be empty";
                    }
                    return null;
                  },),


        // Bagian Kotak Daftar
        height(20),
        Container(
          width: 417.21,
          height: 48.14,
          decoration: BoxDecoration(color: const Color.fromARGB(255, 188, 198, 206), borderRadius: BorderRadius.circular(10.7)),
          child: TextButton(onPressed: (){
            if(_formKey.currentState!.validate()) {

              // Menampilkan AlertDialog Ringkasan Data
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text("Confirm Registration Data"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${nameController.text}"),
                      Text("Email: ${emailController.text}"),
                      Text("Phone Number: ${phoneController.text}"),
                      Text("City Of Domicile: ${cityController.text}"),
                    ],),
                    actions: [TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context); }),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 194, 200, 204)),
                    onPressed: (){
                  Navigator.pop(context); // Tutup dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(
                        name: nameController.text,
                        city: cityController.text,
                      ),
                    ),
                  );
                    }, child: Text("Next"),)
                  
                  ],
                );
              });
            }

            // Jika data belum lengkap
            else {
              showDialog(context: context,
              builder: (context){
                return AlertDialog(title: Text("Validation Error"),
                content: Text("Please fill all fields!"),
                actions:[
                  TextButton(child: Text("Ok"),
                  onPressed: (){
                    Navigator.pop(context);
                  },),
                ]);
              });
            }
          }, child: Text("Regist", style: TextStyle(fontSize: 21.74, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold))),
            ),],
            ),
          ),
        ),
      ),
    );
  }


  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
      ],
    );
  }
}