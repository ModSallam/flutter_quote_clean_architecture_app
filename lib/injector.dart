import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/api/app_interceptors.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/api/base_api_consumer.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/api/dio_consumer.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/network/network_info.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/data/repositories/quote_repository.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/repositories/base_quote_repository.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/domain/usecases/get_random_quote_use_case.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/data/datasources/language_locale_data_source.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/data/repositories/language_repository.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/repositories/base_language_repository.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/usecases/change_language_use_case.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/domain/usecases/get_saved_language_use_case.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features
  // Blocs
  serviceLocator.registerFactory(
      () => RandomQuoteCubit(getRandomQuoteUseCase: serviceLocator()));

  serviceLocator.registerFactory(
    () => LocaleCubit(
      getSavedLanguageUseCase: serviceLocator(),
      changeLanguageUseCase: serviceLocator(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(
      () => GetRandomQuoteUseCase(quoteRepository: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => GetSavedLanguageUseCase(languageRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => ChangeLanguageUseCase(languageRepository: serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<BaseQuoteRepository>(
    () => QuoteReposritory(
      networkInfo: serviceLocator(),
      randomQuoteRemoteDataSource: serviceLocator(),
      randomQuoteLocalDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<BaseLanguageRepository>(
    () => LanguageRepository(
      languageLocaleDataSource: serviceLocator(),
    ),
  );

  // Data Sources
  serviceLocator.registerLazySingleton<BaseRandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSource(sharedPreferences: serviceLocator()));
  serviceLocator.registerLazySingleton<BaseRandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSource(apiConsumer: serviceLocator()));

  serviceLocator.registerLazySingleton<BaseLanguageLocaleDataSource>(
      () => LanguageLocaleDataSource(sharedPreferences: serviceLocator()));

  //! Core
  //Network
  serviceLocator.registerLazySingleton<BaseNetworkInfo>(
      () => NetworkInfo(connectionChecker: serviceLocator()));

  // Api Consumer
  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // http
  // serviceLocator.registerLazySingleton(() => http.Client());

  // Dio
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => AppInterceptors());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  // Internet Connection Checker
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
