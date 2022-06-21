// import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final int id;
  final String name;
  final String gambar;
  final String email;
  final String job;
  final String faculty;
  final String bio;

  User({
    required this.id,
    required this.name,
    required this.gambar,
    required this.email,
    required this.job,
    required this.faculty,
    required this.bio
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        gambar: json['gambar'],
        email: json['email'],
        job: json['job'],
        faculty: json['faculty'],
        bio: json['bio']);
  }
}
