import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/image.dart';
import 'package:muslim/repository/api_repository.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final muslimRepository = ApiRepository();
  ImageCubit() : super(ImageInitial());

  Future<void> getImage() async {
    emit(ImageLoading());
    try {
      BackgroundImage image = await muslimRepository.getImage();
      emit(ImageLoaded(image: image));
    } catch (e) {
      emit(ImageError(message: e.toString()));
    }
  }
}
