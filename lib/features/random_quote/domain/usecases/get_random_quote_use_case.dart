import 'package:dartz/dartz.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/usecases/usecase.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/entities/quote.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/repositories/base_quote_repository.dart';

class GetRandomQuoteUseCase implements UseCase<Quote, NoParams> {
  final BaseQuoteRepository quoteRepository;

  const GetRandomQuoteUseCase({required this.quoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
