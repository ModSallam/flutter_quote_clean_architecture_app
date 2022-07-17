import 'package:random_quote_clean_architecture_bloc_app/core/error/exceptions.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/data/datasources/language_locale_data_source.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/repositories/base_language_repository.dart';

class LanguageRepository implements BaseLanguageRepository {
  final BaseLanguageLocaleDataSource languageLocaleDataSource;

  const LanguageRepository({required this.languageLocaleDataSource});

  @override
  Future<Either<Failure, bool>> changeLanguage(
      {required String languageCode}) async {
    try {
      final languageIsChanged = await languageLocaleDataSource.changeLanguage(
          languageCode: languageCode);
      return Right(languageIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedLanguage() async {
    try {
      final languageCode = await languageLocaleDataSource.getSavedLanguage();
      return Right(languageCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
