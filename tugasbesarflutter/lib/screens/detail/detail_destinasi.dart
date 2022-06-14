import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/main.dart';
import 'package:tugasbesarflutter/models/Destinasi.dart';

class DetailDestinasi extends StatefulWidget {
  const DetailDestinasi({Key? key, required this.destinasi}) : super(key: key);

  final Destinasi destinasi;

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
                backgroundColor: const Color.fromARGB(217, 217, 217, 217),
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
              body: ListView(shrinkWrap: true, children: <Widget>[
                Column(
                  children: [
                    Container(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ),
                                Text(
                                  widget.destinasi.namaTempat,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins-Bold',
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          Center(
                            child:
                                Image.asset('assets/img/map.png', height: 300),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: const Text(
                              "Informasi Terkait",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Text(widget.destinasi.deskripsi),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text('Foto',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child:
                                Image.asset('assets/img/danau.png', height: 70),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Komentar',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Color(0x00C8C8C8),
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    hintText: "Komentar..",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(255, 59, 61, 58)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Kirim',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Color(0xFF1A2E35),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                            ],
                          ),
                          Card(
                            margin: EdgeInsets.only(left: 30, right: 50),
                            child: ListTile(
                              leading: Image.asset('assets/img/profile.png',
                                  height: 30),
                              title: Text('Elita - 23 Maret 2022'),
                              subtitle: Text('Hehe...'),
                            ),
                          )
                        ])),
                  ],
                ),
              ]))),
    );
  }
}
