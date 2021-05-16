part of 'wirid_cubit.dart';

abstract class WiridState extends Equatable {}

class WiridInitial extends WiridState {
  @override
  List<Object> get props => [];
}

class WiridLoading extends WiridState {
  @override
  List<Object> get props => [];
}

class WiridLoaded extends WiridState {
  final List<Wirid> wirid;

  WiridLoaded({required this.wirid});
  @override
  List<Object?> get props => [wirid];
}

class WiridError extends WiridState {
  final String message;

  WiridError({required this.message});
  @override
  List<Object?> get props => [message];
}
