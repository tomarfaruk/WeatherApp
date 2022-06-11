import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather_search/data/models/search_weather_model.dart';
import 'package:weather_app/features/weather_search/domain/entities/search_weather_entity.dart';

import '../../../mock_data/mock_data_reader.dart';

void main() {
  const mockdataUrl = 'weather_data.json';
  final testJson = mockDataReader(mockdataUrl);
  final weatherResponse = WeatherSearchResponseModel.fromJson(testJson);
  group('WeatherSearchResponseModel Twst', () {
    test("from json", () {
      expect(weatherResponse, isA<WeatherSearchResponseModel>());
    });
    test("to json", () {
      expect(weatherResponse.toMap(), equals(json.decode(testJson)));
    });

    test("empty copyWith is equal", () {
      expect(weatherResponse.copyWith() == weatherResponse, isTrue);
    });

    test("to entity", () {
      expect(weatherResponse.toEntity(), isA<SearchWeatherEntity>());
    });
  });
}
