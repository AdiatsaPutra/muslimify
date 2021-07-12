part of 'doa_harian_cubit.dart';

abstract class DoaHarianState extends Equatable {}

class DoaHarianInitial extends DoaHarianState {
  @override
  List<Object?> get props => [];
}

class DoaHarianLoading extends DoaHarianState {
  @override
  List<Object> get props => [];
}

class DoaHarianLoaded extends DoaHarianState {
  final List<DoaHarian> doaHarian;

  DoaHarianLoaded({required this.doaHarian});
  @override
  List<Object?> get props => [doaHarian];
}

class DoaHarianError extends DoaHarianState {
  final String message;

  DoaHarianError({required this.message});
  @override
  List<Object?> get props => [message];
}
