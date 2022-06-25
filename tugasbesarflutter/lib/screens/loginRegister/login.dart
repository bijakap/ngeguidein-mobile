import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/screens/loginRegister/register.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasbesarflutter/main.dart';
import 'package:tugasbesarflutter/api.dart';

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
          context, MaterialPageRoute(builder: (context) => ABP()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Di-Guide-in",
          style: TextStyle(
            fontFamily: 'Poppins-Bold',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: const Color(0x00d9d9d9),
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
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              buttonColor: Color(0xff1A2E35),
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisPage()),
                  );
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
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Input Tidak Boleh Kosong'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
              ),
            ),
          ],
        ),
      );
      return;
    }
    final response = await http.post(
      Uri.parse(Apis.baseUrl + '/api/login'),
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
      var findIdUser = jsonDecode(response.body)['user']['id'];
      var token = jsonEncode(findToken);
      var name = jsonEncode(findName);
      var idUser = jsonEncode(findIdUser);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('name', name);
      await prefs.setString('id', idUser);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ABP()));
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text("Email Atau Password Salah"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
              ),
            ),
          ],
        ),
      );
    }
  }
}
