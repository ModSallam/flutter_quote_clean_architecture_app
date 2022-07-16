import 'package:flutter/material.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/screens/quote_screen.dart';

class Routes {
  static const String initialRoute = '/';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const QuoteScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
