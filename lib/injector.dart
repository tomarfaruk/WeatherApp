import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network_checker/network_checker.dart';
import 'features/weather_search/data/datasources/weather_local_data_source.dart';
import 'features/weather_search/data/datasources/wiather_remote_data_source.dart';
import 'features/weather_search/data/repositories/search_weather_repository_impl.dart';
import 'features/weather_search/domain/repositories/search_weather_repository.dart';
import 'features/weather_search/domain/usecases/search_weather_usecase.dart';
import 'features/weather_search/presentation/bloc/weather_search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Weather Search
  // Bloc
  sl.registerFactory(
    () => WeatherSearchBloc(usecase: sl()),
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

  //! External
  sl.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
