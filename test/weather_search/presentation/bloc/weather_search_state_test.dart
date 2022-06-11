import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather_search/data/models/search_weather_model.dart';
import 'package:weather_app/features/weather_search/presentation/bloc/weather_search_bloc.dart';

import '../../../mock_data/mock_data_reader.dart';

void main() {
  group("weather search state test", () {
    const mockdataUrl = 'weather_data.json';
    final testJson = mockDataReader(mockdataUrl);
    final weatherResponse = WeatherSearchResponseModel.fromJson(testJson);
    test('returns correct values for WeatherSearchStateInitial', () {
      final state = WeatherSearchStateInitial();
      expect(state is WeatherSearchStateInitial, isTrue);
      expect(state is WeatherSearchStateLoading, isFalse);
      expect(state is WeatherSearchStateLoaded, isFalse);
      expect(state is WeatherSearchStateError, isFalse);
    });
    test('returns correct values for WeatherSearchStateLoading', () {
      final state = WeatherSearchStateLoading();
      expect(state is WeatherSearchStateInitial, isFalse);
      expect(state == WeatherSearchStateLoading, isTrue);
      expect(state is WeatherSearchStateLoaded, isFalse);
      expect(state is WeatherSearchStateError, isFalse);
    });
    test('returns correct values for WeatherSearchStateLoaded', () {
      final state = WeatherSearchStateLoaded(weatherResponse.toEntity());
      expect(state is WeatherSearchStateInitial, isFalse);
      expect(state is WeatherSearchStateLoading, isFalse);
      expect(state is WeatherSearchStateLoaded, isTrue);
      expect(state is WeatherSearchStateError, isFalse);
    });
    test('returns correct values for WeatherSearchStateError', () {
      const state = WeatherSearchStateError("error message");
      expect(state is WeatherSearchStateInitial, isFalse);
      expect(state is WeatherSearchStateLoading, isFalse);
      expect(state is WeatherSearchStateLoaded, isFalse);
      expect(state is WeatherSearchStateError, isTrue);
    });
  });
}
