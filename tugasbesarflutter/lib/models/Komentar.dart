class Komentar {
  final String idDestinasi;
  final String idUser;
  final String komentar;

  Komentar(
      {required this.idDestinasi,
      required this.idUser,
      required this.komentar});

  factory Komentar.fromJson(Map<String, dynamic> json) {
    return Komentar(
        idDestinasi: json['id_destinasi'],
        idUser: json['id_user'],
        komentar: json['komentar']);
  }
}
