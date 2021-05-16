import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String textId;

  Quote({required this.textId});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(textId: json['text_id']);
  }

  @override
  List<Object?> get props => [textId];
}
