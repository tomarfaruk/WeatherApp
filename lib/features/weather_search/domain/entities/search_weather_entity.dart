import 'dart:convert';

import 'package:equatable/equatable.dart';

class SearchWeatherEntity extends Equatable {
  final String name;
  final String weatherMain;
  final String weatherDescription;
  final double temp;
  final double tempMax;
  final double tempMin;
  final int pressure;
  final int humidity;
  const SearchWeatherEntity({
    required this.name,
    required this.weatherMain,
    required this.weatherDescription,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.pressure,
    required this.humidity,
  });

  SearchWeatherEntity copyWith({
    String? name,
    String? weatherMain,
    String? weatherDescription,
    double? temp,
    double? tempMax,
    double? tempMin,
    int? pressure,
    int? humidity,
  }) {
    return SearchWeatherEntity(
      name: name ?? this.name,
      weatherMain: weatherMain ?? this.weatherMain,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      temp: temp ?? this.temp,
      tempMax: tempMax ?? this.tempMax,
      tempMin: tempMin ?? this.tempMin,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'weatherMain': weatherMain});
    result.addAll({'weatherDescription': weatherDescription});
    result.addAll({'temp': temp});
    result.addAll({'tempMax': tempMax});
    result.addAll({'tempMin': tempMin});
    result.addAll({'pressure': pressure});
    result.addAll({'humidity': humidity});

    return result;
  }

  factory SearchWeatherEntity.fromMap(Map<String, dynamic> map) {
    return SearchWeatherEntity(
      name: map['name'] ?? '',
      weatherMain: map['weatherMain'] ?? '',
      weatherDescription: map['weatherDescription'] ?? '',
      temp: map['temp']?.toDouble() ?? 0.0,
      tempMax: map['tempMax']?.toDouble() ?? 0.0,
      tempMin: map['tempMin']?.toDouble() ?? 0.0,
      pressure: map['pressure']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchWeatherEntity.fromJson(String source) =>
      SearchWeatherEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchWeatherEntity(name: $name, weatherMain: $weatherMain, weatherDescription: $weatherDescription, temp: $temp, tempMax: $tempMax, tempMin: $tempMin, pressure: $pressure, humidity: $humidity)';
  }

  @override
  List<Object> get props {
    return [
      name,
      weatherMain,
      weatherDescription,
      temp,
      tempMax,
      tempMin,
      pressure,
      humidity,
    ];
  }
}
