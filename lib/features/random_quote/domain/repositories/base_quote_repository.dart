import 'package:dartz/dartz.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/entities/quote.dart';

abstract class BaseQuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
