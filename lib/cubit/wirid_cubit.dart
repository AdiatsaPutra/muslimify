import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/wirid.dart';
import 'package:muslim/repository/api_repository.dart';

part 'wirid_state.dart';

class WiridCubit extends Cubit<WiridState> {
  final apiRepository = ApiRepository();
  WiridCubit() : super(WiridInitial());

  Future<void> getWirid() async {
    try {
      emit(WiridLoading());
      List<Wirid> wirid = await apiRepository.getWirid();
      emit(WiridLoaded(wirid: wirid));
    } catch (message) {
      emit(WiridError(message: message.toString()));
    }
  }
}
