import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/models.dart';
import 'package:muslim/repository/api_repository.dart';

part 'tahlil_state.dart';

class TahlilCubit extends Cubit<TahlilState> {
  final apiRepository = ApiRepository();
  TahlilCubit() : super(TahlilInitial());

  Future<void> getTahlil() async {
    try {
      emit(TahlilLoading());
      List<Tahlil> tahlil = await apiRepository.getTahlil();
      emit(TahlilLoaded(tahlil: tahlil));
    } catch (message) {
      emit(TahlilError(message: message.toString()));
    }
  }
}
