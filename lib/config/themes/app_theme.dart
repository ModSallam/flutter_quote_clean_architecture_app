import 'package:flutter/material.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_colors.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(
      button: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
