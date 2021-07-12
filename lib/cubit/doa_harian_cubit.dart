import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/models.dart';
import 'package:muslim/repository/api_repository.dart';

part 'doa_harian_state.dart';

class DoaHarianCubit extends Cubit<DoaHarianState> {
  final apiRepository = ApiRepository();

  DoaHarianCubit() : super(DoaHarianInitial());

  Future<void> getDoaHarian() async {
    try {
      emit(DoaHarianLoading());
      List<DoaHarian> doaHarian = await apiRepository.getDoaHarian();
      emit(DoaHarianLoaded(doaHarian: doaHarian));
    } catch (message) {
      emit(DoaHarianError(message: message.toString()));
    }
  }
}
