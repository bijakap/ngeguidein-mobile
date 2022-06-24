import 'package:flutter/material.dart';
import 'package:flutter_application_auth/home_page.dart';
import 'package:flutter_application_auth/login_page.dart';
import 'package:flutter_application_auth/register_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => Loginpage(),
        'regis': (context) => RegisPage(),
        'Home': (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
    );
  }
}
