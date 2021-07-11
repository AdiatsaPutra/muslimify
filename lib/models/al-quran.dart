// To parse this JSON data, do
//
//     final alQuran = alQuranFromJson(jsonString);

class AlQuran {
  AlQuran({
    required this.arti,
    required this.asma,
    required this.audio,
    required this.ayat,
    required this.keterangan,
    required this.nama,
    required this.nomor,
    required this.rukuk,
    required this.type,
    required this.urut,
  });

  final String arti;
  final String asma;
  final String audio;
  final int ayat;
  final String keterangan;
  final String nama;
  final String nomor;
  final String rukuk;
  final String type;
  final String urut;

  factory AlQuran.fromJson(Map<String, dynamic> json) => AlQuran(
        arti: json["arti"],
        asma: json["asma"],
        audio: json["audio"],
        ayat: json["ayat"],
        keterangan: json["keterangan"],
        nama: json["nama"],
        nomor: json["nomor"],
        rukuk: json["rukuk"],
        type: json["type"],
        urut: json["urut"],
      );
}
