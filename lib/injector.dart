import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/data/datasources/remote_data_source.dart';

import 'core/data/datasources/weather_local_data_source.dart';
import 'features/weather_search/presentation/bloc/weather_search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => WeatherSearchBloc(
        // concrete: sl(),
        ),
  );

  // Use cases
  // sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));

  // Repository
  // sl.registerLazySingleton<NumberTriviaRepository>(
  //   () => NumberTriviaRepositoryImpl(
  //     localDataSource: sl(),
  //     networkInfo: sl(),
  //     remoteDataSource: sl(),
  //   ),
  // );

  // Data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
