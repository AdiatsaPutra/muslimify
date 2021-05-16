import 'package:equatable/equatable.dart';

class Wirid extends Equatable {
  final int id;
  final int times;
  final String arabic;
  final String tnc;

  Wirid({
    required this.id,
    required this.times,
    required this.arabic,
    required this.tnc,
  });

  factory Wirid.fromJson(Map<String, dynamic> json) => Wirid(
        id: json["id"],
        times: json["times"],
        arabic: json["arabic"],
        tnc: json["tnc"],
      );

  @override
  List<Object?> get props => [id, times, arabic, tnc];
}
