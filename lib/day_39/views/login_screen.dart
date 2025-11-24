import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_zahra/Tugas15Flutter/service/api.dart';
import 'package:ppkd_zahra/Tugas15Flutter/preferences/preference_handler.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/drawer_screen.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/get_profile_screen.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/register_screen.dart';
import 'package:ppkd_zahra/Tugas15Flutter/widgets/login_button.dart';
import 'package:ppkd_zahra/day_39/service/firebase.dart';

class LoginScreenDay33 extends StatefulWidget {
  const LoginScreenDay33({super.key});
  static const id = "/login_screen18";

  @override
  State<LoginScreenDay33> createState() => _LoginScreenDay33State();
}

class _LoginScreenDay33State extends State<LoginScreenDay33> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisibility = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  /// TITLE
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Login to continue",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 35),

                  /// CARD LOGIN
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 22,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          buildTitle("Email"),
                          buildTextField(
                            hintText: "example@gmail.com",
                            controller: emailController,
                            icon: const Icon(Icons.email_outlined),
                            validator: validateEmail,
                          ),

                          const SizedBox(height: 20),

                          buildTitle("Password"),
                          buildTextField(
                            hintText: "********",
                            controller: passwordController,
                            icon: const Icon(Icons.lock_outline),
                            isPassword: true,
                            validator: validatePassword,
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.brown.shade400,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          /// LOGIN BUTTON
                          LoginButton(
                            text: "Login",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                print(emailController.text);
                                PreferenceHandler.saveLogin(true);
                                // final data = await DbHelper.loginUser(
                                //   email: emailController.text,
                                //   password: passwordController.text,
                                // );
                                final data = await FirebaseService.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                print(data);
                                if (data != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DrawerScreenDay33(),
                                    ),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Email atau password salah",
                                  );
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Validation Error"),
                                      content: Text("Please fill all fields"),
                                      actions: [
                                        TextButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Batal"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// REGISTER LINK
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(fontSize: 13),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreenDay33(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.brown.shade400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// VALIDATOR
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email tidak boleh kosong";
    if (!value.contains('@')) return "Email tidak valid";

    if (!RegExp(
      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
    ).hasMatch(value)) {
      return "Format Email tidak valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password tidak boleh kosong";
    if (value.length < 6) return "Minimal 6 karakter";
    return null;
  }

  /// --- WIDGET REUSABLE ------------------------------------------------------

  Widget buildTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    Icon? icon,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xffF3F3F3),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  setState(() => isVisibility = !isVisibility);
                },
              )
            : null,
      ),
    );
  }
}
