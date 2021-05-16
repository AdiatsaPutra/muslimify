import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/datasource/api_repository.dart';
import 'package:muslim/models/models.dart';

part 'asmaul_husna_state.dart';

class AsmaulHusnaCubit extends Cubit<AsmaulHusnaState> {
  final apiRepository = ApiRepository();
  AsmaulHusnaCubit() : super(AsmaulHusnaInitial());

  Future<void> getAsmaulHusna() async {
    try {
      emit(AsmaulHusnaLoading());
      List<AsmaulHusna> asmaulHusna = await apiRepository.getAsmaulHusna();
      emit(AsmaulHusnaLoaded(asmaulHusna: asmaulHusna));
    } catch (message) {
      emit(AsmaulHusnaError(message: message.toString()));
    }
  }
}
