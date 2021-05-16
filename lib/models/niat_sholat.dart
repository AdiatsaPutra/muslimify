import 'package:equatable/equatable.dart';

class NiatSholat extends Equatable {
  final int id;
  final String name;
  final String latin;
  final String arabic;
  final String terjemahan;

  NiatSholat(
      {required this.id,
      required this.name,
      required this.latin,
      required this.arabic,
      required this.terjemahan});

  factory NiatSholat.fromJson(Map<String, dynamic> json) => NiatSholat(
        id: json["id"],
        name: json["name"],
        latin: json["latin"],
        arabic: json["arabic"],
        terjemahan: json["terjemahan"],
      );

  @override
  List<Object?> get props => [id, name, latin, arabic, terjemahan];
}
