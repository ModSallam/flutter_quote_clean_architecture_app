import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLanguageLocaleDataSource {
  Future<bool> changeLanguage({required String languageCode});

  Future<String?> getSavedLanguage();
}

class LanguageLocaleDataSource implements BaseLanguageLocaleDataSource {
  final SharedPreferences sharedPreferences;

  const LanguageLocaleDataSource({required this.sharedPreferences});

  @override
  Future<bool> changeLanguage({required String languageCode}) async =>
      await sharedPreferences.setString(AppStrings.locale, languageCode);

  @override
  Future<String?> getSavedLanguage() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)
          : AppStrings.englishCode;
}
