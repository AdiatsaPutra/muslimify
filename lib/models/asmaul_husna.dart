import 'package:equatable/equatable.dart';

class AsmaulHusna extends Equatable {
  final String index;
  final String latin;
  final String arabic;
  final String translationId;

  AsmaulHusna(
      {required this.index,
      required this.latin,
      required this.arabic,
      required this.translationId});

  factory AsmaulHusna.fromJson(Map<String, dynamic> json) => AsmaulHusna(
      index: json['index'],
      latin: json['latin'],
      arabic: json['arabic'],
      translationId: json['translation_id']);

  @override
  List<Object?> get props => [index, latin, arabic, translationId];
}
