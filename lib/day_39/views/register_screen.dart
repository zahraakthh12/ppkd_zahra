import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_zahra/Day_39/models/user_firebase_model.dart';
import 'package:ppkd_zahra/Tugas15Flutter/extensions/navigation.dart';
import 'package:ppkd_zahra/Tugas15Flutter/models/regist_model.dart';
import 'package:ppkd_zahra/Tugas15Flutter/preferences/preference_handler.dart';
import 'package:ppkd_zahra/Tugas15Flutter/service/api.dart';

import 'package:ppkd_zahra/Tugas15Flutter/widgets/login_button.dart';
import 'package:ppkd_zahra/day_39/service/firebase.dart';
import 'package:ppkd_zahra/day_39/views/login_screen.dart';

class RegisterScreenDay33 extends StatefulWidget {
  const RegisterScreenDay33({super.key});
  static const id = "/register_day33";

  @override
  State<RegisterScreenDay33> createState() => _RegisterScreenDay33State();
}

class _RegisterScreenDay33State extends State<RegisterScreenDay33> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isVisibility = false;
  bool isLoading = false;

  UserFirebaseModel user = UserFirebaseModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  /// --- TITLE ---
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Register to continue",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 35),

                  /// --- CARD REGISTER ---
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          buildTitle("Name"),
                          buildInput(
                            controller: nameController,
                            hint: "Enter your name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name tidak boleh kosong";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 18),

                          buildTitle("Email Address"),
                          buildInput(
                            controller: emailController,
                            hint: "example@gmail.com",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email tidak boleh kosong";
                              }
                              if (!value.contains("@")) {
                                return "Email tidak valid";
                              }
                              if (!RegExp(
                                r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                              ).hasMatch(value)) {
                                return "Format Email tidak valid";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 18),

                          buildTitle("Password"),
                          buildInput(
                            controller: passwordController,
                            hint: "********",
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password tidak boleh kosong";
                              }
                              if (value.length < 6) {
                                return "Password minimal 6 karakter";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 28),

                          /// --- REGISTER BUTTON ---
                          LoginButton(
                            text: "Register",
                            isLoading: isLoading,
                            onPressed: registerUser,
                          ),

                          const SizedBox(height: 15),

                          /// --- ALREADY HAVE ACCOUNT ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Have an account?"),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown.shade400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// REGISTER LOGIC
  registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => isLoading = true);

    try {
      final result = await FirebaseService.registerUser(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
      );

      user = result;
      PreferenceHandler.saveToken(user.uid!);

      setState(() => isLoading = false);

      context.pushReplacement(LoginScreenDay33());
    } catch (e) {
      setState(() => isLoading = false);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  /// --- UI ELEMENTS ---

  Widget buildTitle(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildInput({
    required TextEditingController controller,
    required String hint,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword ? !isVisibility : false,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
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
                onPressed: () => setState(() => isVisibility = !isVisibility),
              )
            : null,
      ),
    );
  }
}
