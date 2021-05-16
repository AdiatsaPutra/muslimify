part of 'image_cubit.dart';

abstract class ImageState extends Equatable {}

class ImageInitial extends ImageState {
  @override
  List<Object> get props => [];
}

class ImageLoading extends ImageState {
  @override
  List<Object> get props => [];
}

class ImageLoaded extends ImageState {
  final BackgroundImage image;

  ImageLoaded({required this.image});
  @override
  List<Object?> get props => [image];
}

class ImageError extends ImageState {
  final String message;

  ImageError({required this.message});
  @override
  List<Object?> get props => [message];
}
