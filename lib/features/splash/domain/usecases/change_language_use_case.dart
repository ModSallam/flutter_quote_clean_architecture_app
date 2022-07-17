import 'package:random_quote_clean_architecture_bloc_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/usecases/usecase.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/repositories/base_language_repository.dart';

class ChangeLanguageUseCase implements UseCase<bool, String> {
  final BaseLanguageRepository languageRepository;

  const ChangeLanguageUseCase({required this.languageRepository});

  @override
  Future<Either<Failure, bool>> call(String languageCode) async =>
      await languageRepository.changeLanguage(languageCode: languageCode);
}
