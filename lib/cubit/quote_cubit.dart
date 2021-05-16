import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim/models/quote.dart';
import 'package:muslim/repository/api_repository.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final muslimRepository = ApiRepository();
  QuoteCubit() : super(QuoteInitial());

  Future<void> getQuote() async {
    emit(QuoteLoading());
    try {
      Quote quote = await muslimRepository.getQuote();
      emit(QuoteLoaded(quote: quote));
    } catch (e) {
      emit(QuoteError(message: e.toString()));
    }
  }
}
