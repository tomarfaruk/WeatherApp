import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/weather_search/data/models/search_weather_model.dart';
import '../../../resources/k_strings.dart';
import '../../error/exception.dart';

abstract class WeatherLocalDataSource {
  /// Gets the cached [WeatherSearchResponseModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<WeatherSearchResponseModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(
      WeatherSearchResponseModel weatherSearchResponseModel);
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherSearchResponseModel> getLastNumberTrivia() {
    final jsonString =
        sharedPreferences.getString(Kstrings.cachedWeatherDataKey);
    if (jsonString != null) {
      return Future.value(WeatherSearchResponseModel.fromJson(jsonString));
    } else {
      throw DatabaseException('Not cached yet');
    }
  }

  @override
  Future<void> cacheNumberTrivia(WeatherSearchResponseModel triviaToCache) {
    return sharedPreferences.setString(
      Kstrings.cachedWeatherDataKey,
      triviaToCache.toJson(),
    );
  }
}
