import 'package:flutter/material.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/widgets/body_content.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: const BodyContent(),
    );
  }
}
