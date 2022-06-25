class Komentar {
  final int idDestinasi;
  final String name;
  final String komentar;
  final String create_at;

  const Komentar(
      {required this.idDestinasi,
      required this.name,
      required this.komentar,
      required this.create_at});

  factory Komentar.fromJson(Map<String, dynamic> json) {
    return Komentar(
        idDestinasi: json['id_destinasi'],
        name: json['name'],
        komentar: json['komen'],
        create_at: json['created_at']);
  }
}
