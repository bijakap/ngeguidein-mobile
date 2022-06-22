class Komentar {
  final int idDestinasi;
  final int idUser;
  final String komentar;
  final String create_at;

  const Komentar(
      {required this.idDestinasi,
      required this.idUser,
      required this.komentar,
      required this.create_at});

  factory Komentar.fromJson(Map<String, dynamic> json) {
    return Komentar(
        idDestinasi: json['id_destinasi'],
        idUser: json['id_user'],
        komentar: json['komentar'],
        create_at: json['create_at']);
  }
}
