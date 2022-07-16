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
      bodyMedium: TextStyle(
        height: 1.5,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColors.transparent,
      titleTextStyle: const TextStyle(
        fontSize: 22.0,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
