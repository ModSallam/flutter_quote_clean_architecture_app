import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_clean_architecture_bloc_app/config/locale/app_localizations_setup.dart';
import 'package:random_quote_clean_architecture_bloc_app/config/routes/app_routes.dart';
import 'package:random_quote_clean_architecture_bloc_app/config/themes/app_theme.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:random_quote_clean_architecture_bloc_app/injector.dart'
    as injector;
import 'config/locale/app_localizations_setup.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              injector.serviceLocator<LocaleCubit>()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            locale: state.locale,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
