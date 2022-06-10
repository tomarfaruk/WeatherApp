import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entities/search_weather_entity.dart';

class WeatherSearchResponseModel extends Equatable {
  final String base;
  final String name;
  final int visibility;
  final int dt;
  final int timezone;
  final int id;
  final int cod;
  final CoordModel coord;
  final MainModel main;
  final WindModel wind;
  final CloudsModel clouds;
  final SysModel sys;
  final List<WeatherModel> weather;
  const WeatherSearchResponseModel({
    required this.base,
    required this.name,
    required this.visibility,
    required this.dt,
    required this.timezone,
    required this.id,
    required this.cod,
    required this.coord,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.sys,
    required this.weather,
  });

  SearchWeatherEntity toEntity() => SearchWeatherEntity(
        humidity: main.humidity,
        name: name,
        pressure: main.pressure,
        temp: main.temp,
        tempMax: main.tempMax,
        tempMin: main.tempMin,
        weatherMain: weather.first.main,
        weatherDescription: weather.first.description,
      );

  WeatherSearchResponseModel copyWith({
    String? base,
    String? name,
    int? visibility,
    int? dt,
    int? timezone,
    int? id,
    int? cod,
    CoordModel? coord,
    MainModel? main,
    WindModel? wind,
    CloudsModel? clouds,
    SysModel? sys,
    List<WeatherModel>? weather,
  }) {
    return WeatherSearchResponseModel(
      base: base ?? this.base,
      name: name ?? this.name,
      visibility: visibility ?? this.visibility,
      dt: dt ?? this.dt,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      cod: cod ?? this.cod,
      coord: coord ?? this.coord,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      sys: sys ?? this.sys,
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'base': base});
    result.addAll({'name': name});
    result.addAll({'visibility': visibility});
    result.addAll({'dt': dt});
    result.addAll({'timezone': timezone});
    result.addAll({'id': id});
    result.addAll({'cod': cod});
    result.addAll({'coord': coord.toMap()});
    result.addAll({'main': main.toMap()});
    result.addAll({'wind': wind.toMap()});
    result.addAll({'clouds': clouds.toMap()});
    result.addAll({'sys': sys.toMap()});
    result.addAll({'weather': weather.map((x) => x.toMap()).toList()});

    return result;
  }

  factory WeatherSearchResponseModel.fromMap(Map<String, dynamic> map) {
    return WeatherSearchResponseModel(
      base: map['base'] ?? '',
      name: map['name'] ?? '',
      visibility: map['visibility']?.toInt() ?? 0,
      dt: map['dt']?.toInt() ?? 0,
      timezone: map['timezone']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      cod: map['cod']?.toInt() ?? 0,
      coord: CoordModel.fromMap(map['coord']),
      main: MainModel.fromMap(map['main']),
      wind: WindModel.fromMap(map['wind']),
      clouds: CloudsModel.fromMap(map['clouds']),
      sys: SysModel.fromMap(map['sys']),
      weather: List<WeatherModel>.from(
          map['weather']?.map((x) => WeatherModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherSearchResponseModel.fromJson(String source) =>
      WeatherSearchResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherSearchModel(base: $base, name: $name, visibility: $visibility, dt: $dt, timezone: $timezone, id: $id, cod: $cod, coord: $coord, main: $main, wind: $wind, clouds: $clouds, sys: $sys, weather: $weather)';
  }

  @override
  List<Object> get props {
    return [
      base,
      name,
      visibility,
      dt,
      timezone,
      id,
      cod,
      coord,
      main,
      wind,
      clouds,
      sys,
      weather,
    ];
  }
}

class CoordModel extends Equatable {
  final double lon;
  final double lat;
  const CoordModel({
    required this.lon,
    required this.lat,
  });

  CoordModel copyWith({
    double? lon,
    double? lat,
  }) {
    return CoordModel(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'lon': lon});
    result.addAll({'lat': lat});

    return result;
  }

  factory CoordModel.fromMap(Map<String, dynamic> map) {
    return CoordModel(
      lon: map['lon']?.toDouble() ?? 0.0,
      lat: map['lat']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordModel.fromJson(String source) =>
      CoordModel.fromMap(json.decode(source));

  @override
  String toString() => 'CoordModel(lon: $lon, lat: $lat)';

  @override
  List<Object> get props => [lon, lat];
}

class WeatherModel extends Equatable {
  final int id;
  final String main;
  final String icon;
  final String description;
  const WeatherModel({
    required this.id,
    required this.main,
    required this.icon,
    required this.description,
  });

  WeatherModel copyWith({
    int? id,
    String? main,
    String? icon,
    String? description,
  }) {
    return WeatherModel(
      id: id ?? this.id,
      main: main ?? this.main,
      icon: icon ?? this.icon,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'main': main});
    result.addAll({'icon': icon});
    result.addAll({'description': description});

    return result;
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      id: map['id']?.toInt() ?? 0,
      main: map['main'] ?? '',
      icon: map['icon'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherModel(id: $id, main: $main, icon: $icon, description: $description)';
  }

  @override
  List<Object> get props => [id, main, icon, description];
}

class MainModel extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;
  const MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  MainModel copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    return MainModel(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'temp': temp});
    result.addAll({'feels_like': feelsLike});
    result.addAll({'temp_min': tempMin});
    result.addAll({'temp_max': tempMax});
    result.addAll({'pressure': pressure});
    result.addAll({'humidity': humidity});
    result.addAll({'sea_level': seaLevel});
    result.addAll({'grnd_level': grndLevel});

    return result;
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp']?.toDouble() ?? 0.0,
      feelsLike: map['feels_like']?.toDouble() ?? 0.0,
      tempMin: map['temp_min']?.toDouble() ?? 0.0,
      tempMax: map['temp_max']?.toDouble() ?? 0.0,
      pressure: map['pressure']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
      seaLevel: map['sea_level']?.toInt() ?? 0,
      grndLevel: map['grnd_level']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) =>
      MainModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MainModel(temp: $temp, feels_like: $feelsLike, temp_min: $tempMin, temp_max: $tempMax, pressure: $pressure, humidity: $humidity, sea_level: $seaLevel, grnd_level: $grndLevel)';
  }

  @override
  List<Object> get props {
    return [
      temp,
      feelsLike,
      tempMin,
      tempMax,
      pressure,
      humidity,
      seaLevel,
      grndLevel,
    ];
  }
}

class WindModel extends Equatable {
  final double speed;
  final double deg;
  const WindModel({
    required this.speed,
    required this.deg,
  });

  WindModel copyWith({
    double? speed,
    double? deg,
  }) {
    return WindModel(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'speed': speed});
    result.addAll({'deg': deg});

    return result;
  }

  factory WindModel.fromMap(Map<String, dynamic> map) {
    return WindModel(
      speed: map['speed']?.toDouble() ?? 0.0,
      deg: map['deg']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WindModel.fromJson(String source) =>
      WindModel.fromMap(json.decode(source));

  @override
  String toString() => 'WindModel(speed: $speed, deg: $deg)';

  @override
  List<Object> get props => [speed, deg];
}

class SysModel extends Equatable {
  final int type;
  final int id;
  final String country;
  final int sunset;
  final int sunrise;
  const SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunset,
    required this.sunrise,
  });

  SysModel copyWith({
    int? type,
    int? id,
    String? country,
    int? sunset,
    int? sunrise,
  }) {
    return SysModel(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunset: sunset ?? this.sunset,
      sunrise: sunrise ?? this.sunrise,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'id': id});
    result.addAll({'country': country});
    result.addAll({'sunset': sunset});
    result.addAll({'sunrise': sunrise});

    return result;
  }

  factory SysModel.fromMap(Map<String, dynamic> map) {
    return SysModel(
      type: map['type']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      country: map['country'] ?? '',
      sunset: map['sunset']?.toInt() ?? 0,
      sunrise: map['sunrise']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SysModel.fromJson(String source) =>
      SysModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SysModel(type: $type, id: $id, country: $country, sunset: $sunset, sunrise: $sunrise)';
  }

  @override
  List<Object> get props {
    return [
      type,
      id,
      country,
      sunset,
      sunrise,
    ];
  }
}

class CloudsModel extends Equatable {
  final int all;
  const CloudsModel({
    required this.all,
  });

  CloudsModel copyWith({
    int? all,
  }) {
    return CloudsModel(
      all: all ?? this.all,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'all': all});

    return result;
  }

  factory CloudsModel.fromMap(Map<String, dynamic> map) {
    return CloudsModel(
      all: map['all']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CloudsModel.fromJson(String source) =>
      CloudsModel.fromMap(json.decode(source));

  @override
  String toString() => 'CloudsModel(all: $all)';

  @override
  List<Object> get props => [all];
}
