import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/screens/profile/profile.dart';
import 'package:tugasbesarflutter/screens/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ABP(),
    );
  }
}

class ABP extends StatelessWidget {
  const ABP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TugasBesar(),
    );
  }
}

class TugasBesar extends StatefulWidget {
  const TugasBesar({Key? key}) : super(key: key);

  @override
  State<TugasBesar> createState() => _TugasBesarState();
}

class _TugasBesarState extends State<TugasBesar> {
  int _selectedIndex = 0;
  bool login = true;

  final List<Widget> _widgetOptions = const <Widget>[
    HalamanHome(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  tampilanHome() {
    if (login == false && _selectedIndex == 1) {
      return const NotLogin();
    } else {
      return _widgetOptions.elementAt(_selectedIndex);
    }
  }

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
        // child: _widgetOptions.elementAt(_selectedIndex),
        child: tampilanHome(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class NotLogin extends StatelessWidget {
  const NotLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("Belom Login Ceritanya"));
  }
}
