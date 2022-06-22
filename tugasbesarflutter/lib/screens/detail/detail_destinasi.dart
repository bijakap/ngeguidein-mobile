import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/api.dart';
// import 'package:tugasbesarflutter/main.dart';
import 'package:tugasbesarflutter/models/Destinasi.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:tugasbesarflutter/models/komentar.dart';

class DetailDestinasi extends StatefulWidget {
  const DetailDestinasi({Key? key, required this.destinasi}) : super(key: key);

  final Destinasi destinasi;

  @override
  State<DetailDestinasi> createState() => _DetailDestinasiState();
}

class _DetailDestinasiState extends State<DetailDestinasi> {
  late Future<List<Komentar>> futureKomentar;

  @override
  void initState() {
    super.initState();
    futureKomentar = fetchKomentar();
  }

  final komentarController = TextEditingController();
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  static const LatLng _kMapCenter =
      LatLng(-6.973316094903573, 107.63032874757012);
  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 17.0, tilt: 0, bearing: 0);

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("M1"),
          position: LatLng(-6.973316094903573, 107.63032874757012),
          infoWindow: InfoWindow(
              title: 'Telkom University',
              snippet: 'Click Here To Open On Google Maps',
              onTap: () => MapsLauncher.launchCoordinates(
                  -6.973316094903573, 107.63032874757012, 'Telkom University')),
          icon: BitmapDescriptor.defaultMarker),
    };
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    komentarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(217, 217, 217, 217),
          title: Text(
            widget.destinasi.namaTempat,
            style: const TextStyle(
              fontFamily: 'Poppins-Bold',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _kInitialPosition,
              myLocationEnabled: true,
              markers: _createMarker(),
              // mapToolbarEnabled: true,
              // onMapCreated: (GoogleMapController controller),
            ),
            SlidingUpPanel(
              panel: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Column(children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                  child: Text(
                                    widget.destinasi.namaTempat,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins-Bold',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: const Text(
                                "Informasi Terkait",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              margin: const EdgeInsets.only(bottom: 10),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                widget.destinasi.deskripsi,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text('Foto',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Image.asset('assets/img/danau.png',
                                  height: 70),
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
                                    controller: komentarController,
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
                                            color: Color.fromARGB(
                                                255, 59, 61, 58)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                    onPressed: () {
                                      // Ini Nanti Matiin aja, nanti panggilnya method post api
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content:
                                                Text(komentarController.text),
                                          );
                                        },
                                      );
                                    },
                                    child: Text('Kirim',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.white,
                                        primary: Color(0xFF1A2E35),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ))),
                              ],
                            ),
                            FutureBuilder<List<Komentar>>(
                                future: futureKomentar,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Komentar> data = snapshot.data!;
                                    return Column(
                                      children: [
                                        for (var i = 0; i < data.length; i++)
                                          Card(
                                            margin: EdgeInsets.only(
                                                left: 30, right: 50),
                                            child: ListTile(
                                              leading: Image.asset(
                                                  'assets/img/profile.png',
                                                  height: 30),
                                              title: Text(
                                                  data[i].idUser.toString()),
                                              subtitle: Text(data[i].komentar),
                                            ),
                                          )
                                      ],
                                    );
                                    //  Text(data.length.toString());
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  return const CircularProgressIndicator();
                                })
                            // Card(
                            //   margin: EdgeInsets.only(left: 30, right: 50),
                            //   child: ListTile(
                            //     leading: Image.asset('assets/img/profile.png',
                            //         height: 30),
                            //     title: Text('Elita - 23 Maret 2022'),
                            //     subtitle: Text('Hehe...'),
                            //   ),
                            // )
                          ])),
                    ],
                  ),
                ],
              ),
              collapsed: Container(
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: radius),
                child: Center(
                  child: Text(
                    widget.destinasi.namaTempat,
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              borderRadius: radius,
            )
          ],
        ));
  }
}
