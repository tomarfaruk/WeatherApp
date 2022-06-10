import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/search_weather_entity.dart';
import '../repositories/search_weather_repository.dart';

class SearchWeatherUsecase {
  final SearchWeatherRepository repository;

  SearchWeatherUsecase(this.repository);
  Future<Either<Failure, SearchWeatherEntity>> call(String q) async {
    return await repository.getWeather(q);
  }
}
