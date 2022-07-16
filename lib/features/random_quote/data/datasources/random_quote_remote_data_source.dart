import 'package:random_quote_clean_architecture_bloc_app/core/api/base_api_consumer.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/api/end_points.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/models/quote_model.dart';

abstract class BaseRandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSource implements BaseRandomQuoteRemoteDataSource {
  final BaseApiConsumer apiConsumer;

  const RandomQuoteRemoteDataSource({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuoteUrl);
    return QuoteModel.fromJson(response);
  }
}
