import 'package:dartz/dartz.dart';

import '../../../../core/data/datasources/wiather_remote_data_source.dart';
import '../../../../core/data/datasources/weather_local_data_source.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network_checker/network_checker.dart';
import '../../domain/entities/search_weather_entity.dart';
import '../../domain/repositories/search_weather_repository.dart';

class SearchWeatherRepositoryImpl extends SearchWeatherRepository {
  final WeatherRemoteDataSource dataSource;
  final NetworkChecker networkChecker;
  final WeatherLocalDataSource localDataSource;
  SearchWeatherRepositoryImpl({
    required this.dataSource,
    required this.networkChecker,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, SearchWeatherEntity>> getWeather(String q) async {
    try {
      final result = await dataSource.searchWeather(q);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
