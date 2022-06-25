// import 'package:tugasbesarflutter/models/StepDestinasi.dart';

class Destinasi {
  final int idDestinasi;
  final String namaTempat;
  final String deskripsi;
  final String src;
  final double latitude;
  final double longitude;
  // final StepDestinasi petunjuk;

  const Destinasi({
    required this.idDestinasi,
    required this.namaTempat,
    required this.deskripsi,
    required this.src,
    required this.latitude,
    required this.longitude,
    // required this.petunjuk,
  });

  factory Destinasi.fromJson(Map<String, dynamic> json) {
    return Destinasi(
        idDestinasi: json['id_destinasi'],
        namaTempat: json['nama_tempat'],
        deskripsi: json['deskripsi'],
        src: json['src'],
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']));
  }
}
