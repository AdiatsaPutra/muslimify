import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doa_harian_state.dart';

class DoaHarianCubit extends Cubit<DoaHarianState> {
  DoaHarianCubit() : super(DoaHarianInitial());
}
