import 'package:flutter/material.dart';
// import 'package:tugasbesarflutter/main.dart';
import 'package:tugasbesarflutter/models/Destinasi.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:tugasbesarflutter/models/StepDestinasi.dart';
import 'package:tugasbesarflutter/models/komentar.dart';
import 'package:tugasbesarflutter/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailDestinasi extends StatefulWidget {
  const DetailDestinasi({Key? key, required this.destinasi}) : super(key: key);

  final Destinasi destinasi;

  @override
  State<DetailDestinasi> createState() => _DetailDestinasiState();
}

class _DetailDestinasiState extends State<DetailDestinasi> {
  late Future<List<Komentar>> futureKomentar;
  late Future<List<StepDestinasi>> futureStep;
  bool login = true;

  final komentarController = TextEditingController();
  final PanelController _panelController = PanelController();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  Set<Marker> _markers = {};

  loadPinPoint() {
    _markers.add(
      Marker(
          markerId: const MarkerId("M1"),
          position:
              LatLng(widget.destinasi.latitude, widget.destinasi.longitude),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                Apis.baseUrl + widget.destinasi.src,
                              ),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                      GestureDetector(
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: 10, left: 8, right: 8),
                          child: const Text(
                            "Tap Here To Open Google Maps",
                            style: TextStyle(
                                fontFamily: 'Poppins-Bold',
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () => MapsLauncher.launchCoordinates(
                            widget.destinasi.latitude,
                            widget.destinasi.longitude,
                            'Danau Galau'),
                      )
                    ],
                  ),
                ),
                LatLng(widget.destinasi.latitude, widget.destinasi.longitude));
          },
          icon: BitmapDescriptor.defaultMarker),
    );

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    futureKomentar = fetchKomentar(widget.destinasi.idDestinasi);
    futureStep = fetchStepDestinasi(widget.destinasi.idDestinasi);
    loadPinPoint();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    komentarController.dispose();
    super.dispose();
  }

  void togglePanel() {
    _panelController.isPanelOpen
        ? _panelController.close()
        : _panelController.open();
  }

  void validasiLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? val = prefs.getString("token");
    if (val == null) {
      setState(() {
        login = false;
      });
    } else {
      setState(() {
        login = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SlidingUpPanel(
        controller: _panelController,
        parallaxEnabled: true,
        parallaxOffset: 0.6,
        minHeight: MediaQuery.of(context).size.height * 0.1,
        panel: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: togglePanel,
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 10,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade400),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        height: 15,
                      ),
                      Container(
                        child: const Text(
                          "Informasi Terkait",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          widget.destinasi.deskripsi,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FutureBuilder<List<StepDestinasi>>(
                          future: futureStep,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<StepDestinasi> data = snapshot.data!;
                              if (data.isEmpty) {
                                return Image.network(
                                  Apis.baseUrl + widget.destinasi.src,
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                );
                              } else {
                                return Column(
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: const Text("Foto",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold))),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Image.network(
                                          Apis.baseUrl + widget.destinasi.src,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                        )),
                                    for (int i = 0; i < data.length; i++)
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Image.network(
                                            Apis.baseUrl + data[i].src,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                          )),
                                  ],
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            return const Center(
                                child: CircularProgressIndicator());
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Komentar',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      login == true
                          ? Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: komentarController,
                                    decoration: InputDecoration(
                                      fillColor: const Color(0x00C8C8C8),
                                      filled: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      hintText: "Komentar..",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
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
                                      setState(() {
                                        futureKomentar = postKomentar(
                                            widget.destinasi.idDestinasi,
                                            komentarController.text);
                                      });
                                      komentarController.clear();
                                    },
                                    child: const Text('Kirim',
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
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Login Untuk Menambahkan Komentar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                      FutureBuilder<List<Komentar>>(
                          future: futureKomentar,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Komentar> data = snapshot.data!;
                              // setState(() {
                              //   _idDestinasi = data[0].idDestinasi;
                              // });
                              return Column(
                                children: [
                                  for (var i = 0; i < data.length; i++)
                                    Card(
                                      margin: const EdgeInsets.all(10),
                                      child: ListTile(
                                        leading: Image.asset(
                                            'assets/img/profile.png',
                                            height: 30),
                                        // title: Text(data[i].name),
                                        title: Text(data[i].name),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data[i].komentar),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(data[i].create_at),
                                            )
                                          ],
                                        ),
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
                    ])),
              ],
            ),
          ),
        ),
        borderRadius: radius,
        body: FutureBuilder<List<StepDestinasi>>(
            future: futureStep,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<StepDestinasi> data = snapshot.data!;
                for (int i = 0; i < data.length; i++) {
                  _markers.add(
                    Marker(
                      markerId: MarkerId(data[i].namaPetunjuk),
                      position: LatLng(data[i].latitude, data[i].longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                      onTap: () {
                        _customInfoWindowController.addInfoWindow!(
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            Apis.baseUrl + data[i].src,
                                          ),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      data[i].namaPetunjuk,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins-Bold',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            LatLng(data[i].latitude, data[i].longitude));
                      },
                    ),
                  );
                }
                return Stack(children: <Widget>[
                  GoogleMap(
                    onTap: (position) {
                      _customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      _customInfoWindowController.onCameraMove!();
                    },
                    onMapCreated: (GoogleMapController controller) async {
                      _customInfoWindowController.googleMapController =
                          controller;
                    },
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(widget.destinasi.latitude,
                            widget.destinasi.longitude),
                        zoom: 15.6,
                        tilt: 0,
                        bearing: 0),
                  ),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: 150,
                    width: 200,
                    offset: 50,
                  ),
                ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return Center(child: const CircularProgressIndicator());
            }),
      ),
    );
  }
}
