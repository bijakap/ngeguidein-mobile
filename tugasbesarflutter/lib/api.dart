import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:tugasbesarflutter/models/Destinasi.dart';

class Apis {
  // Sesuaiin sama IP address, biar mobile bisa akses
  static const baseUrl = 'http://192.168.1.8:8000';
}

Future<List<Destinasi>> fetchDestinasi() async {
  final response = await http
      .get(Uri.parse(Apis.baseUrl + '/api/pilihan'))
      .timeout(const Duration(seconds: 5));

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
