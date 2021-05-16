import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/ayat_hari_ini.dart';
import 'package:muslim/repository/api_repository.dart';

part 'ayat_hari_ini_state.dart';

class AyatHariIniCubit extends Cubit<AyatHariIniState> {
  final muslimRepository = ApiRepository();
  AyatHariIniCubit() : super(AyatHariIniInitial());

  Future<void> getAyatHariIni() async {
    try {
      emit(AyatHariIniLoading());
      AyatHariIni ayatHariIni = await muslimRepository.getAyatHariIni();
      emit(AyatHariIniLoaded(ayatHariIni: ayatHariIni));
    } catch (message) {
      emit(AyatHariIniError(message: message.toString()));
    }
  }
}
