import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_clean_architecture_bloc_app/app.dart';
import 'package:random_quote_clean_architecture_bloc_app/app_bloc_observer.dart';
import 'package:random_quote_clean_architecture_bloc_app/injector.dart'
    as injector;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setup();
  BlocOverrides.runZoned(
    () => runApp(const QuoteApp()),
    blocObserver: AppBlocObserver(),
  );
}
