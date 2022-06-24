// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_auth/home_page.dart';
import 'package:flutter_application_auth/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    validasiLogin();
  }

  void validasiLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? val = prefs.getString("token");
    if (val != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                child: Text("LOGIN",
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
            Text("Email",
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold)),
            TextFormField(
              controller: txtUsername,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Password",
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold)),
            TextFormField(
              obscureText: true,
              controller: txtPassword,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff1A2E35)),
                onPressed: () {
                  this._doLogin();
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("atau"),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              buttonColor: Color(0xff1A2E35),
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'regis');
                },
                child: Text(
                  "Daftar",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _doLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(
              context: context,
              title: "Tolong masukan Username atau Password",
              type: AlertType.error)
          .show();
      return;
    }
    final response = await http.post(
      Uri.parse('http://192.168.1.4:8000/api/v1/login'),
      body: {
        'email': txtUsername.text,
        'password': txtPassword.text,
      },
      headers: {
        'Accept': 'applications/Json',
      },
    );

    if (response.statusCode == 200) {
      // Alert(context: context, title: "Login Berhasil", type: AlertType.success)
      //     .show();
      var findToken = jsonDecode(response.body)['token'];
      var findName = jsonDecode(response.body)['user']['name'];
      var token = jsonEncode(findToken);
      var name = jsonEncode(findName);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('name', name);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
    }
  }
}
