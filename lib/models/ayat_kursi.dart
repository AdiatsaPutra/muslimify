import 'package:equatable/equatable.dart';

class AyatKursi extends Equatable {
  final String tafsir;
  final String translation;
  final String arabic;
  final String latin;

  AyatKursi(
      {required this.tafsir,
      required this.translation,
      required this.arabic,
      required this.latin});

  factory AyatKursi.fromJson(Map<String, dynamic> json) {
    return AyatKursi(
        tafsir: json['tafsir'],
        translation: json['translation'],
        arabic: json['arabic'],
        latin: json['latin']);
  }

  @override
  List<Object?> get props => [tafsir, translation, arabic, latin];
}
