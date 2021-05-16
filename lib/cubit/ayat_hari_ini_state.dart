part of 'ayat_hari_ini_cubit.dart';

abstract class AyatHariIniState extends Equatable {}

class AyatHariIniInitial extends AyatHariIniState {
  @override
  List<Object> get props => [];
}

class AyatHariIniLoading extends AyatHariIniState {
  @override
  List<Object> get props => [];
}

class AyatHariIniLoaded extends AyatHariIniState {
  final AyatHariIni ayatHariIni;

  AyatHariIniLoaded({required this.ayatHariIni});
  @override
  List<Object?> get props => [ayatHariIni];
}

class AyatHariIniError extends AyatHariIniState {
  final String message;

  AyatHariIniError({required this.message});
  @override
  List<Object?> get props => [message];
}
