import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_zahra/Tugas15Flutter/constant/endpoint.dart';
import 'package:ppkd_zahra/Tugas15Flutter/models/get_profile_model.dart';
import 'package:ppkd_zahra/Tugas15Flutter/models/login_model.dart';
import 'package:ppkd_zahra/Tugas15Flutter/models/regist_model.dart';
import 'package:ppkd_zahra/Tugas15Flutter/preferences/preference_handler.dart';

class AuthAPI {
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<GetProfileModel?> getProfile() async {
    final token = await PreferenceHandler.getToken();

    final url = Uri.parse(Endpoint.getProfile);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return GetProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Failed to get profile");
    }
  }

  static Future<bool> updateProfile({
    required String name,
    required String email,
  }) async {
    final token = await PreferenceHandler.getToken();

    final url = Uri.parse(Endpoint.updateProfile);
    final response = await http.put(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      body: {"name": name, "email": email},
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Update gagal");
    }
  }
}
