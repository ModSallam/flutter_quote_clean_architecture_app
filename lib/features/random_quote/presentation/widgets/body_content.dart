import 'package:flutter/material.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/widgets/custom_refresh_indicator.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/widgets/quote_content.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        QuoteContnet(),
        CustomRefreshIndicator(),
      ],
    );
  }
}
