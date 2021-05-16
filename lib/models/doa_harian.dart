import 'package:equatable/equatable.dart';

class DoaHarian extends Equatable {
  final String title;
  final String arabic;
  final String latin;
  final String translation;

  DoaHarian({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  factory DoaHarian.fromJson(Map<String, dynamic> json) => DoaHarian(
        title: json["title"],
        arabic: json["arabic"],
        latin: json["latin"],
        translation: json["translation"],
      );

  @override
  List<Object?> get props => [title, arabic, latin, translation];
}
