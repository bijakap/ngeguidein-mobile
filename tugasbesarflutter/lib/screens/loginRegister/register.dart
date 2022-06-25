import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/api.dart';
import 'package:tugasbesarflutter/main.dart';
import 'package:tugasbesarflutter/screens/loginRegister/login.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
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
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
        )));
  }

  Future _doDaftar() async {
    String Name = ctrlName.text;
    String Email = ctrlEmail.text;
    String Password = ctrlPassword.text;
    if (Name.isEmpty || Email.isEmpty) {
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
      Uri.parse(Apis.baseUrl + '/api/register'),
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
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Row(children: const [
            Icon(Icons.check_circle),
            Text("Daftar Akun Berhasil")
          ]),
          // content: const Text("Email Atau Password Salah"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginpage()));
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text("Gagal Mendaftarkan Akun"),
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
