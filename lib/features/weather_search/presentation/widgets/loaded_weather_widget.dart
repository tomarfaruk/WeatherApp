import 'package:flutter/material.dart';
import '../../../../core/remote_urls.dart';
import '../../domain/entities/search_weather_entity.dart';

class LoadedWeatherWidget extends StatelessWidget {
  const LoadedWeatherWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final SearchWeatherEntity weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weather.name),
        Image.network(RemoteUrls.iconUrl(weather.icon)),
        Text(
          '${weather.temp}°',
          style: const TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${weather.tempMin}°"),
            Text(weather.weatherMain),
            Text("${weather.tempMax}°"),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
