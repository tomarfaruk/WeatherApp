import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather_search/data/datasources/weather_local_data_source.dart';
import 'package:weather_app/features/weather_search/data/models/search_weather_model.dart';
import 'package:weather_app/resources/k_strings.dart';

import '../../../mock_data/mock_data_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late WeatherLocalDataSourceImpl weatherLocalDataSourceImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    weatherLocalDataSourceImpl =
        WeatherLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  const mockdataUrl = 'weather_data.json';
  final testJson = mockDataReader(mockdataUrl);
  final weatherResponse = WeatherSearchResponseModel.fromJson(testJson);

  group("getLastWeather", () {
    test("Get WeatherSearchResponseModel which was last store successfully",
        () async {
      //arrange
      when(() => mockSharedPreferences.getString(Kstrings.cachedWeatherDataKey))
          .thenReturn(testJson);

      //act

      final result = await weatherLocalDataSourceImpl.getLastWeather();

      //assert
      verify(() =>
              mockSharedPreferences.getString(Kstrings.cachedWeatherDataKey))
          .called(1);

      expect(result, equals(weatherResponse));
    });
    test("Get WeatherSearchResponseModel which throwA exception", () async {
      //arrange
      when(() => mockSharedPreferences.getString(Kstrings.cachedWeatherDataKey))
          .thenReturn(null);

      //act
      final result = weatherLocalDataSourceImpl.getLastWeather;

      //assert
      expect(() => result(), throwsA(const TypeMatcher<DatabaseException>()));
    });
  });
  group("cacheWeather", () {
    test("cacheWeather WeatherSearchResponseModel successfully", () async {
      //arrange
      when(() => mockSharedPreferences.setString(
              Kstrings.cachedWeatherDataKey, weatherResponse.toJson()))
          .thenAnswer((invocation) => Future.value(true));

      //act
      final result =
          await weatherLocalDataSourceImpl.cacheWeather(weatherResponse);

      //assert
      verify(() => mockSharedPreferences.setString(
          Kstrings.cachedWeatherDataKey, weatherResponse.toJson())).called(1);

      expect(result, equals(true));
    });
  });
}
