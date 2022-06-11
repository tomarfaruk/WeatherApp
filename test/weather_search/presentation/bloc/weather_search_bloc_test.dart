import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather_search/data/models/search_weather_model.dart';
import 'package:weather_app/features/weather_search/domain/usecases/search_weather_usecase.dart';
import 'package:weather_app/features/weather_search/presentation/bloc/weather_search_bloc.dart';

import '../../../mock_data/mock_data_reader.dart';

class MockSearchWeatherUsecase extends Mock implements SearchWeatherUsecase {}

void main() {
  late WeatherSearchBloc bloc;
  late MockSearchWeatherUsecase mockSearchWeatherUsecase;

  setUp(() {
    mockSearchWeatherUsecase = MockSearchWeatherUsecase();

    bloc = WeatherSearchBloc(usecase: mockSearchWeatherUsecase);
  });

  test('initialState should be WeatherSearchStateInitial', () {
    // assert
    expect(bloc.state, equals(WeatherSearchStateInitial()));
  });

  group("WeatherSearchEventSearch test", () {
    const mockdataUrl = 'weather_data.json';
    final testJson = mockDataReader(mockdataUrl);
    final weatherResponse = WeatherSearchResponseModel.fromJson(testJson);

    const location = "Naogaon";
    const networkError = "Network error";
    const dbError = "Database error";
    test("should call search weather use case", () async {
      // arrange
      when(() => mockSearchWeatherUsecase(location))
          .thenAnswer((_) async => Right(weatherResponse.toEntity()));

      // act
      bloc.add(const WeatherSearchEventSearch(location));
      await untilCalled(() => mockSearchWeatherUsecase(location));

      //assert
      verify(() => mockSearchWeatherUsecase(location)).called(1);
    });

    blocTest<WeatherSearchBloc, WeatherSearchState>(
      'should emit [Loading, Loaded] state when data successfully received',
      build: () => bloc,
      setUp: () {
        when(() => mockSearchWeatherUsecase(location))
            .thenAnswer((_) async => Right(weatherResponse.toEntity()));
      },
      act: (bloc) => bloc.add(const WeatherSearchEventSearch(location)),
      expect: () => [
        // WeatherSearchStateInitial(),
        WeatherSearchStateLoading(),
        WeatherSearchStateLoaded(weatherResponse.toEntity()),
      ],
    );
    blocTest<WeatherSearchBloc, WeatherSearchState>(
      'should emit Server error [Loading, Error] state when call usecase',
      build: () => bloc,
      setUp: () {
        when(() => mockSearchWeatherUsecase(location))
            .thenAnswer((_) async => const Left(ServerFailure(networkError)));
      },
      act: (bloc) => bloc.add(const WeatherSearchEventSearch(location)),
      expect: () => [
        // WeatherSearchStateInitial(),
        WeatherSearchStateLoading(),
        const WeatherSearchStateError(networkError),
        // WeatherSearchStateLoaded(weatherResponse.toEntity()),
      ],
    );
    blocTest<WeatherSearchBloc, WeatherSearchState>(
      'should emit database error [Loading, Error] state when call usecase',
      build: () => bloc,
      setUp: () {
        when(() => mockSearchWeatherUsecase(location))
            .thenAnswer((_) async => const Left(DatabaseFailure(dbError)));
      },
      act: (bloc) => bloc.add(const WeatherSearchEventSearch(location)),
      expect: () => [
        // WeatherSearchStateInitial(),
        WeatherSearchStateLoading(),
        const WeatherSearchStateError(dbError),
        // WeatherSearchStateLoaded(weatherResponse.toEntity()),
      ],
    );
  });
}
