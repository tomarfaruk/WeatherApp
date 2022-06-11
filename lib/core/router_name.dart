import 'package:flutter/material.dart';
import '../features/weather_search/presentation/pages/weather_search_page.dart';

class RouteNames {
  static const String weatherSearchPage = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.weatherSearchPage:
        return MaterialPageRoute(builder: (_) => const WeatherSearchPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: Colors.red,
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
