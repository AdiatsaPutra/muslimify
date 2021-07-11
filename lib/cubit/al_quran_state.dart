part of 'al_quran_cubit.dart';

abstract class AlQuranState extends Equatable {}

class AlQuranInitial extends AlQuranState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AlQuranLoading extends AlQuranState {
  @override
  List<Object> get props => [];
}

class AlQuranLoaded extends AlQuranState {
  final List<AlQuran> alQuran;

  AlQuranLoaded({required this.alQuran});
  @override
  List<Object?> get props => [alQuran];
}

class AlQuranError extends AlQuranState {
  final String message;

  AlQuranError({required this.message});
  @override
  List<Object?> get props => [message];
}
