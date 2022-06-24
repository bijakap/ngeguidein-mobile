import 'package:flutter/material.dart';
import 'package:flutter_application_auth/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = "";
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCread();
  }

  void getCread() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token")!;
      name = prefs.getString("name")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome ${name}",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Loginpage()),
                    (route) => false);
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Selamat Datang ${token}"),
            ],
          ),
        ));
  }
}
