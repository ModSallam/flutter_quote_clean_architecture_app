import 'package:flutter/material.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_colors.dart';

class QuoteContnet extends StatelessWidget {
  const QuoteContnet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          const Text(
            'The most amazing achievement of the computer software industry is its continuing cancellation of the steady and staggering gains made by the computer hardware industry.',
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: const Text(
              'Henry Petroski',
            ),
          ),
        ],
      ),
    );
  }
}
