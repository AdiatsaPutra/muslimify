import 'package:equatable/equatable.dart';

class BackgroundImage extends Equatable {
  final String image;

  BackgroundImage({required this.image});

  factory BackgroundImage.fromJson(Map<String, dynamic> json) {
    return BackgroundImage(image: json['image']);
  }
  @override
  List<Object?> get props => [image];
}
