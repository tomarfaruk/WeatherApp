import 'package:weather_app/core/data/datasources/remote_data_source.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/entities/search_weather_entity.dart';
import '../../domain/repositories/search_weather_repository.dart';

class SearchWeatherRepositoryImpl extends SearchWeatherRepository {
  final WeatherRemoteDataSource dataSource;

  SearchWeatherRepositoryImpl(this.dataSource);
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
