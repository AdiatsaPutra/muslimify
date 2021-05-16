import 'package:equatable/equatable.dart';

class Tahlil extends Equatable {
  final int id;
  final String title;
  final String arabic;
  final String translation;

  Tahlil({
    required this.id,
    required this.title,
    required this.arabic,
    required this.translation,
  });

  factory Tahlil.fromJson(Map<String, dynamic> json) => Tahlil(
        id: json["id"],
        title: json["title"],
        arabic: json["arabic"],
        translation: json["translation"],
      );

  @override
  List<Object?> get props => [id, title, arabic, translation];
}
