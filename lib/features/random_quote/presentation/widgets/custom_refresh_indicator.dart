import 'package:flutter/material.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.refresh,
          size: 28.0,
        ),
      ),
    );
  }
}
