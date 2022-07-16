import 'package:flutter/material.dart';
import 'package:random_quote_clean_architecture_bloc_app/config/routes/app_routes.dart';
import 'package:random_quote_clean_architecture_bloc_app/config/themes/app_theme.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
