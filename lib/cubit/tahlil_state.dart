part of 'tahlil_cubit.dart';

abstract class TahlilState extends Equatable {
}

class TahlilInitial extends TahlilState {
  @override
  List<Object> get props => [];
}

class TahlilLoading extends TahlilState {
  @override
  List<Object> get props => [];
}

class TahlilLoaded extends TahlilState {
  final List<Tahlil> tahlil;

  TahlilLoaded({required this.tahlil});
  @override
  List<Object?> get props => [tahlil];
}

class TahlilError extends TahlilState {
  final String message;

  TahlilError({required this.message});
  @override
  List<Object?> get props => [message];
}
