import 'dart:convert';

import 'package:random_quote_clean_architecture_bloc_app/core/error/exceptions.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSource implements BaseRandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  const RandomQuoteLocalDataSource({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() async {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote =
          Future.value(QuoteModel.fromJson(jsonDecode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, jsonEncode(quote));
  }
}
