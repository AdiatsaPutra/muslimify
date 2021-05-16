part of 'quote_cubit.dart';

abstract class QuoteState extends Equatable {}

class QuoteInitial extends QuoteState {
  @override
  List<Object> get props => [];
}

class QuoteLoading extends QuoteState {
  @override
  List<Object> get props => [];
}

class QuoteLoaded extends QuoteState {
  final Quote quote;

  QuoteLoaded({required this.quote});
  @override
  List<Object?> get props => [quote];
}

class QuoteError extends QuoteState {
  final String message;

  QuoteError({required this.message});
  @override
  List<Object?> get props => [message];
}
