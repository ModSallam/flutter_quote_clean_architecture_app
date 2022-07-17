import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/usecases/usecase.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/repositories/base_language_repository.dart';

class GetSavedLanguageUseCase implements UseCase<String?, NoParams> {
  final BaseLanguageRepository languageRepository;

  const GetSavedLanguageUseCase({required this.languageRepository});
  @override
  Future<Either<Failure, String?>> call(NoParams params) async =>
      await languageRepository.getSavedLanguage();
}
