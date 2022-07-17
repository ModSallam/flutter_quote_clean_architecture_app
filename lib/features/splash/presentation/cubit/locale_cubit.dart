import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/usecases/usecase.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/usecases/change_language_use_case.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/usecases/get_saved_language_use_case.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLanguageUseCase getSavedLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;

  LocaleCubit(
      {required this.getSavedLanguageUseCase,
      required this.changeLanguageUseCase})
      : super(
          const ChangeLocaleState(
            locale: Locale(AppStrings.englishCode),
          ),
        );

  String currentLanguageCode = AppStrings.englishCode;

  Future<void> getSavedLanguage() async {
    final response = await getSavedLanguageUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = value!;
      emit(ChangeLocaleState(locale: Locale(currentLanguageCode)));
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    final response = await changeLanguageUseCase.call(languageCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = languageCode;
      emit(ChangeLocaleState(locale: Locale(currentLanguageCode)));
    });
  }

  void toEnglish() => _changeLanguage(AppStrings.englishCode);

  void toArabic() => _changeLanguage(AppStrings.arabicCode);
}
