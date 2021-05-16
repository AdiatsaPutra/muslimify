import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/models.dart';
import 'package:muslim/repository/api_repository.dart';

part 'kisah_nabi_state.dart';

class KisahNabiCubit extends Cubit<KisahNabiState> {
  final apiRepository = ApiRepository();
  KisahNabiCubit() : super(KisahNabiInitial());

  Future<void> getKisahNabi() async {
    try {
      emit(KisahNabiLoading());
      List<KisahNabi> kisahNabi = await apiRepository.getKisahNabi();
      emit(KisahNabiLoaded(kisahNabi: kisahNabi));
    } catch (message) {
      emit(KisahNabiError(message: message.toString()));
    }
  }
}
