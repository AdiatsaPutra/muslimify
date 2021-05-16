import 'package:equatable/equatable.dart';

class KisahNabi extends Equatable {
  final String name;
  final String thnKelahiran;
  final dynamic usia;
  final String description;
  final String tmp;
  final String imageUrl;
  final String iconUrl;

  KisahNabi({
    required this.name,
    required this.thnKelahiran,
    required this.usia,
    required this.description,
    required this.tmp,
    required this.imageUrl,
    required this.iconUrl,
  });

  factory KisahNabi.fromJson(Map<String, dynamic> json) => KisahNabi(
        name: json["name"],
        thnKelahiran: json["thn_kelahiran"],
        usia: json["usia"],
        description: json["description"],
        tmp: json["tmp"],
        imageUrl: json["image_url"],
        iconUrl: json["icon_url"],
      );

  @override
  List<Object?> get props =>
      [name, thnKelahiran, usia, description, tmp, imageUrl, iconUrl];
}
