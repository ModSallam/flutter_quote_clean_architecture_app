import 'dart:convert';

import 'package:random_quote_clean_architecture_bloc_app/core/api/end_points.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/error/exceptions.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseRandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSource implements BaseRandomQuoteRemoteDataSource {
  final http.Client client;

  const RandomQuoteRemoteDataSource({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUrl = Uri.parse(EndPoints.randomQuoteUrl);
    final response = await client.get(
      randomQuoteUrl,
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
      },
    );
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
