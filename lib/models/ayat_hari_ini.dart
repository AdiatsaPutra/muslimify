import 'package:equatable/equatable.dart';

class AyatHariIni extends Equatable {
  final String ayat;
  final String surah;
  final int ayatKe;

  AyatHariIni({required this.ayat, required this.surah, required this.ayatKe});

  factory AyatHariIni.fromJson(Map<String, dynamic> json) {
    return AyatHariIni(
      ayat: json['text'],
      surah: json['surah']['englishName'],
      ayatKe: json['surah']['number'],
    );
  }
  @override
  List<Object?> get props => [ayat];
}
