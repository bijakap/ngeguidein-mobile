class Destinasi {
  final int idDestinasi;
  final String namaTempat;
  final String deskripsi;
  final String src;

  const Destinasi(
      {required this.idDestinasi,
      required this.namaTempat,
      required this.deskripsi,
      required this.src});

  factory Destinasi.fromJson(Map<String, dynamic> json) {
    return Destinasi(
        idDestinasi: json['id_destinasi'],
        namaTempat: json['nama_tempat'],
        deskripsi: json['deskripsi'],
        src: json['src']);
  }
}
