import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/al-quran.dart';
import 'package:muslim/repository/api_repository.dart';

part 'al_quran_state.dart';

class AlQuranCubit extends Cubit<AlQuranState> {
  final apiRepository = ApiRepository();

  AlQuranCubit() : super(AlQuranInitial());

  Future<void> getAlQuran() async {
    try {
      emit(AlQuranLoading());
      List<AlQuran> alQuran = await apiRepository.getAlQuran();
      emit(AlQuranLoaded(alQuran: alQuran));
    } catch (message) {
      emit(AlQuranError(message: message.toString()));
    }
  }
}
