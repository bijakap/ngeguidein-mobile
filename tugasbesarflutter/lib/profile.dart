import 'package:flutter/material.dart';

import 'editprofile.dart';

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

  final List<Widget> _widgetOptions = const <Widget>[
    Home(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        child: _widgetOptions.elementAt(_selectedIndex),
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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Text("Halaman Home");
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage(
                    'assets/img/Hiro_Circle.png',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // ignore: use_full_hex_values_for_flutter_colors
                      primary: const Color(0xffff70d4e)),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const EditProfile();
                    }));
                  },
                  child: const Text('Edit Profil'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Armadhani Hiro Juni Permana',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 150.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Mahasiswa',
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                  ),
                ),
                const Text(
                  'Fakultas Informatika',
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                  ),
                ),
                const Text(
                  'Kidding me?',
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
