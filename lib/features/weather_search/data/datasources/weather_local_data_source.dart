import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exception.dart';
import '../../../../resources/k_strings.dart';
import '../models/search_weather_model.dart';

abstract class WeatherLocalDataSource {
  /// Gets the cached [WeatherSearchResponseModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<WeatherSearchResponseModel> getLastWeather();

  Future<bool> cacheWeather(
      WeatherSearchResponseModel weatherSearchResponseModel);
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherSearchResponseModel> getLastWeather() {
    final jsonString =
        sharedPreferences.getString(Kstrings.cachedWeatherDataKey);
    if (jsonString != null) {
      return Future.value(WeatherSearchResponseModel.fromJson(jsonString));
    } else {
      throw DatabaseException('Not cached yet');
    }
  }

  @override
  Future<bool> cacheWeather(WeatherSearchResponseModel triviaToCache) {
    return sharedPreferences.setString(
      Kstrings.cachedWeatherDataKey,
      triviaToCache.toJson(),
    );
  }
}
