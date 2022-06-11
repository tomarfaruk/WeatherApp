import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather_search/presentation/bloc/weather_search_bloc.dart';

void main() {
  // mock location name
  const location = 'Naogaon';
  group('WeatherSearchEvent', () {
    test("WeatherSearchEventSearch value comparison test", () {
      expect(const WeatherSearchEventSearch(location),
          const WeatherSearchEventSearch(location));
    });
  });
}
