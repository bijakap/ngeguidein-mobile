// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_auth/login_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class RegisPage extends StatefulWidget {
  RegisPage({Key? key}) : super(key: key);

  @override
  State<RegisPage> createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  TextEditingController ctrlName = new TextEditingController();
  TextEditingController ctrlEmail = new TextEditingController();
  TextEditingController ctrlPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Text("Register",
                        style: GoogleFonts.poppins(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Username",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: ctrlName,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Email",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: ctrlEmail,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                  controller: ctrlPassword,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  buttonColor: Color(0xff1A2E35),
                  minWidth: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      _doDaftar();
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
          )
        ],
      ),
    );
  }

  Future _doDaftar() async {
    String Name = ctrlName.text;
    String Email = ctrlEmail.text;
    String Password = ctrlPassword.text;
    if (Name.isEmpty || Email.isEmpty) {
      Alert(
              context: context,
              title: "Data tidak boleh kosong",
              type: AlertType.error)
          .show();
      return;
    }
    final response = await http.post(
      Uri.parse('http://192.168.1.4:8000/api/v1/register'),
      body: {
        'name': Name,
        'email': Email,
        'password': Password,
      },
      headers: {
        'Accept': 'applications/Json',
      },
    );

    // progressDialog.hide();
    if (response.statusCode == 200) {
      Alert(
              context: context,
              title: "Registrasi Berasil",
              type: AlertType.success)
          .show();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loginpage()),
          (route) => false);
    } else {
      Alert(context: context, title: "Registrasi Gagal", type: AlertType.error)
          .show();
    }
  }
}

//  logout
// final response = await http.get(
//       Uri.parse('http://192.168.1.2:8000/api/v1/logout'),
//       headers: {
//         'Accept': 'applications/Json',
//         'Authorization' : 'Bearer'
//       }, 
//     );