class StepDestinasi {
  final String namaPetunjuk;
  final String src;
  final double latitude;
  final double longitude;

  const StepDestinasi({
    required this.namaPetunjuk,
    required this.src,
    required this.latitude,
    required this.longitude,
  });

  factory StepDestinasi.fromJson(Map<String, dynamic> json) {
    return StepDestinasi(
        namaPetunjuk: json['step_ke'],
        src: json['src'],
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']));
  }
}
