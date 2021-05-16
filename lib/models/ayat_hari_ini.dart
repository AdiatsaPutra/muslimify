import 'package:equatable/equatable.dart';

class AyatHariIni extends Equatable {
  final String ayat;

  AyatHariIni({required this.ayat});

  factory AyatHariIni.fromJson(Map<String, dynamic> json) {
    return AyatHariIni(ayat: json['text']);
  }
  @override
  List<Object?> get props => [ayat];
}
