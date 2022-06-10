import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/data/datasources/wiather_remote_data_source.dart';
import 'package:weather_app/features/weather_search/domain/repositories/search_weather_repository.dart';

import 'core/data/datasources/weather_local_data_source.dart';
import 'features/weather_search/data/repositories/search_weather_repository_impl.dart';
import 'features/weather_search/domain/usecases/search_weather_usecase.dart';
import 'features/weather_search/presentation/bloc/weather_search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => WeatherSearchBloc(),
  );

  // Use cases
  sl.registerLazySingleton(() => SearchWeatherUsecase(sl()));

  // Repository
  sl.registerLazySingleton<SearchWeatherRepository>(
    () => SearchWeatherRepositoryImpl(
      dataSource: sl(),
      networkChecker: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
