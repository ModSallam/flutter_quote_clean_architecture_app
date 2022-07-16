import 'package:random_quote_clean_architecture_bloc_app/core/error/exceptions.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/network/network_info.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/entities/quote.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/repositories/base_quote_repository.dart';

class QuoteReposritory implements BaseQuoteRepository {
  final BaseNetworkInfo networkInfo;
  final BaseRandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final BaseRandomQuoteLocalDataSource randomQuoteLocalDataSource;

  const QuoteReposritory({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        await randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
