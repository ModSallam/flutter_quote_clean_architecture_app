import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/usecases/usecase.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/entities/quote.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/usecases/get_random_quote_use_case.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoading());

    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(response.fold(
        (failure) => RandomQuoteError(message: _mapFailureToMessage(failure)),
        (quote) => RandomQuoteLoaded(quote: quote)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
