part of 'ayat_kursi_cubit.dart';

abstract class AyatKursiState extends Equatable {}

class AyatKursiInitial extends AyatKursiState {
  @override
  List<Object> get props => [];
}

class AyatKursiLoading extends AyatKursiState {
  @override
  List<Object> get props => [];
}

class AyatKursiLoaded extends AyatKursiState {
  final AyatKursi ayatKursi;

  AyatKursiLoaded({required this.ayatKursi});
  @override
  List<Object?> get props => [ayatKursi];
}

class AyatKursiError extends AyatKursiState {
  final String message;

  AyatKursiError({required this.message});
  @override
  List<Object?> get props => [message];
}
