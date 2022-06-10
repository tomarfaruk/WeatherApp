import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/search_weather_entity.dart';

abstract class SearchWeatherRepository {
  Future<Either<Failure, SearchWeatherEntity>> getWeather(String q);
}
