import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentModel {
  int? id;
  String name;
  String email;
  int? phone;
  String? password;

  StudentModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as int,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}