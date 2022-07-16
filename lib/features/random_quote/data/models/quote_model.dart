import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel({
    required super.author,
    required super.id,
    required super.quote,
    required super.permalink,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        quote: json["quote"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "quote": quote,
        "permalink": permalink,
      };
}
