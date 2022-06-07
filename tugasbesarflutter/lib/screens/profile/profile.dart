import 'package:flutter/material.dart';
import 'editprofile.dart';

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
