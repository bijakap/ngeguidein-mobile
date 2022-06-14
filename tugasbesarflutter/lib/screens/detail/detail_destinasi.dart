import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/main.dart';

class DetailDestinasi extends StatefulWidget {
  const DetailDestinasi({Key? key}) : super(key: key);

  @override
  State<DetailDestinasi> createState() => _DetailDestinasiState();
}

class _DetailDestinasiState extends State<DetailDestinasi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(217, 217, 217, 217),
            title: const Text(
              'di-guide-in',
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(children: [
                    Row(children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ABP()),
                          );
                        },
                        child: const Text(
                          '<-- Kembali',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 250.0,
                      ),
                      Text(
                        'Destinasi: Danau Galau',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins-Bold',
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    Center(
                      child: Image.asset('assets/img/map.png', height: 300),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "Informasi Terkait",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                          'Danau galau bisa dibilang salah satu titik di Telkom university yang sangat iconic bagi keluarga tel-u. Danau galauy adalah tempat yang menenangkan, tempat sebagai Pelepas penat, tempat berkumpul, swafoto, dan menjadi item menarik Telkom University'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text('Foto',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: Image.asset('assets/img/danau.png', height: 70),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Komentar',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          children: [
                            Container(
                              width: 320,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Color(0x00C8C8C8),
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 1.0),
                                  hintText: "  Komentar...",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(255, 59, 61, 58)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 90,
                              height: 30,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Kirim',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Color(0xFF1A2E35),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right: 50),
                      child: ListTile(
                        leading:
                            Image.asset('assets/img/profile.png', height: 30),
                        title: Text('Elita - 23 Maret 2022'),
                        subtitle: Text('Hehe...'),
                      ),
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
