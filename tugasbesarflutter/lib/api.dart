import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:tugasbesarflutter/models/Destinasi.dart';

import 'models/user.dart';

class Apis {
  // Sesuaiin sama IP address, biar mobile bisa akses
  static const baseUrl = "http://127.0.0.1:8000";
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

Future<User> fetchUser() async {
  final response = await http.get(
    Uri.parse(Apis.baseUrl + '/api/profile/edit/2')
  );

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

Future<User> updateUser(String username, String email, String job, String faculty, String bio) async {
  try {
    final response = await http.post(
      Uri.parse(Apis.baseUrl + '/api/profile/edit/2'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email' : email,
        'job' : job,
        'faculty' : faculty,
        'bio' : bio,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update user.');
    }
  }on Error catch (e) {
    throw('General Error: $e');
  }
  
}
