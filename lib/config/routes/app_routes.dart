import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:random_quote_clean_architecture_bloc_app/injector.dart'
    as injector;

class Routes {
  static const String initialRoute = '/';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => injector.serviceLocator<RandomQuoteCubit>(),
            child: const QuoteScreen(),
          ),
        );
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
