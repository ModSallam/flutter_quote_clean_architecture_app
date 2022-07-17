import 'package:dartz/dartz.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';

abstract class BaseLanguageRepository {
  Future<Either<Failure, bool>> changeLanguage({required String languageCode});

  Future<Either<Failure, String?>> getSavedLanguage();
}
