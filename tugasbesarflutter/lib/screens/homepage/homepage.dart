import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/screens/detail/detail_destinasi.dart';
import 'package:tugasbesarflutter/models/Destinasi.dart';
import 'package:tugasbesarflutter/api.dart';
// import 'package:tugasbesarflutter/screens/detail/testpage.dart';

class HalamanHome extends StatefulWidget {
  const HalamanHome({Key? key}) : super(key: key);

  @override
  State<HalamanHome> createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {
  late Future<List<Destinasi>> futureDestinasi;

  @override
  void initState() {
    super.initState();
    futureDestinasi = fetchDestinasi();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
      Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Image.asset('assets/img/landing.png'),
          ),
          Container(
            child: const Text(
              "DAFTAR TEMPAT TEMPAT MENARIK :",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16),
            ),
            margin: const EdgeInsets.only(bottom: 10.0),
          ),
          FutureBuilder<List<Destinasi>>(
              future: futureDestinasi,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Destinasi> data = snapshot.data!;
                  return Column(
                    children: [
                      for (var i = 0; i < data.length; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CardDestinasi(data: data[i]),
                        )
                    ],
                  );
                  //  Text(data.length.toString());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return const CircularProgressIndicator();
              })
        ],
      )
    ]);
  }
}

class CardDestinasi extends StatefulWidget {
  const CardDestinasi({Key? key, required this.data}) : super(key: key);

  final Destinasi data;

  @override
  State<CardDestinasi> createState() => _CardDestinasiState();
}

class _CardDestinasiState extends State<CardDestinasi> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              widget.data.namaTempat,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 16),
            ),
            Image.network(
              Apis.baseUrl + widget.data.src,
              height: 150,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailDestinasi(
                    destinasi: widget.data,
                  )),
          // MaterialPageRoute(builder: (context) => const TestPage()),
        );
      },
    );
  }
}

// class TempPage extends StatelessWidget {
//   const TempPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TempPage'),
//       ),
//       body: const Center(child: Text("test")),
//     );
//   }
// }
