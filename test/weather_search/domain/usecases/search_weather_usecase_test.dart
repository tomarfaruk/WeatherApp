import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather_search/data/models/search_weather_model.dart';
import 'package:weather_app/features/weather_search/domain/repositories/search_weather_repository.dart';
import 'package:weather_app/features/weather_search/domain/usecases/search_weather_usecase.dart';

import '../../../mock_data/mock_data_reader.dart';

class MockSearchWeatherRepository extends Mock
    implements SearchWeatherRepository {}

void main() {
  late SearchWeatherUsecase usecase;
  late MockSearchWeatherRepository mockSearchWeatherRepository;

  setUp(() {
    mockSearchWeatherRepository = MockSearchWeatherRepository();
    usecase = SearchWeatherUsecase(mockSearchWeatherRepository);
  });

  const mockdataUrl = 'weather_data.json';
  final testJson = mockDataReader(mockdataUrl);
  final weatherResponse = WeatherSearchResponseModel.fromJson(testJson);

  const mocklocation = "Naogaon";

  test(
    'getWeather successfully from the repository',
    () async {
      // arrange
      when(() => mockSearchWeatherRepository.getWeather(mocklocation))
          .thenAnswer((_) async => Right(weatherResponse.toEntity()));
      // act
      final result = await usecase(mocklocation);
      // assert
      expect(result, Right(weatherResponse.toEntity()));
      verify(() => mockSearchWeatherRepository.getWeather(mocklocation));
      verifyNoMoreInteractions(mockSearchWeatherRepository);
    },
  );
  test(
    'getWeather ServerFailure from the repository if location nof found',
    () async {
      // arrange
      when(() => mockSearchWeatherRepository.getWeather(mocklocation))
          .thenAnswer(
              (_) async => const Left(ServerFailure('location nof found')));
      // act
      final result = await usecase(mocklocation);
      // assert
      expect(result, const Left(ServerFailure('location nof found')));
      // verify(() => mockSearchWeatherRepository.getWeather(mocklocation));
      // verifyNoMoreInteractions(mockSearchWeatherRepository);
    },
  );
}
