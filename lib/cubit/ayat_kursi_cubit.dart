import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/datasource/api_repository.dart';
import 'package:muslim/models/ayat_kursi.dart';

part 'ayat_kursi_state.dart';

class AyatKursiCubit extends Cubit<AyatKursiState> {
  final apiRepository = ApiRepository();
  AyatKursiCubit() : super(AyatKursiInitial());

  Future<void> getAyatKursi() async {
    emit(AyatKursiLoading());
    try {
      AyatKursi ayatKursi = await apiRepository.getAyatKursi();
      emit(AyatKursiLoaded(ayatKursi: ayatKursi));
    } catch (e) {
      emit(AyatKursiError(message: e.toString()));
    }
  }
}
