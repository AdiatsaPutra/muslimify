part of 'kisah_nabi_cubit.dart';

abstract class KisahNabiState extends Equatable {}

class KisahNabiInitial extends KisahNabiState {
  @override
  List<Object> get props => [];
}

class KisahNabiLoading extends KisahNabiState {
  @override
  List<Object> get props => [];
}

class KisahNabiLoaded extends KisahNabiState {
  final List<KisahNabi> kisahNabi;

  KisahNabiLoaded({required this.kisahNabi});
  @override
  List<Object?> get props => [kisahNabi];
}

class KisahNabiError extends KisahNabiState {
  final String message;

  KisahNabiError({required this.message});
  @override
  List<Object?> get props => [message];
}
