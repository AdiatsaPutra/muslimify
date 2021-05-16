part of 'asmaul_husna_cubit.dart';

abstract class AsmaulHusnaState extends Equatable {}

class AsmaulHusnaInitial extends AsmaulHusnaState {
  @override
  List<Object> get props => [];
}

class AsmaulHusnaLoading extends AsmaulHusnaState {
  @override
  List<Object> get props => [];
}

class AsmaulHusnaLoaded extends AsmaulHusnaState {
  final List<AsmaulHusna> asmaulHusna;

  AsmaulHusnaLoaded({required this.asmaulHusna});
  @override
  List<Object?> get props => [asmaulHusna];
}

class AsmaulHusnaError extends AsmaulHusnaState {
  final String message;

  AsmaulHusnaError({required this.message});
  @override
  List<Object?> get props => [message];
}
