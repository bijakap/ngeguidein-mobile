import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:tugasbesarflutter/models/Destinasi.dart';
import 'package:tugasbesarflutter/models/komentar.dart';
// import 'dart:developer' as developer;
// import 'package:flutter/foundation.dart';

import 'models/user.dart';

class Apis {
  // Sesuaiin sama IP address, biar mobile bisa akses
  static const baseUrl = "http://192.168.1.14:8000";
}

Future<List<Destinasi>> fetchDestinasi() async {
  final response = await http
      .get(Uri.parse(Apis.baseUrl + '/api/pilihan'))
      .timeout(const Duration(seconds: 60));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Destinasi.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Komentar>> fetchKomentar(int idDestinasi) async {
  final response = await http
      .get(Uri.parse(Apis.baseUrl + '/api/komentar/' + idDestinasi.toString()))
      .timeout(const Duration(seconds: 60));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Komentar.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Komentar>> postKomentar(
    int idDestinasi, int idUser, String komentar) async {
  final response = await http.post(
    Uri.parse(Apis.baseUrl +
        '/api/komentar/' +
        idDestinasi.toString() +
        '/post_komen/' +
        idUser.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'komen': komentar,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return fetchKomentar(idDestinasi);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse(Apis.baseUrl + '/api/profile/edit/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future updateUser(String username, String email, String password, String job,
    String faculty, String bio) async {
  try {
    final response = await http.post(
      Uri.parse(Apis.baseUrl + '/api/profile/edit/2/post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
        'job': job,
        'faculty': faculty,
        'bio': bio,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return "success";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update user.');
    }
  } on Error catch (e) {
    throw ('General Error: $e');
  }
}
