part of 'weather_search_bloc.dart';

abstract class WeatherSearchEvent extends Equatable {
  const WeatherSearchEvent();

  @override
  List<Object> get props => [];
}

class WeatherSearchEventSearch extends WeatherSearchEvent {
  final String location;
  const WeatherSearchEventSearch(this.location);

  @override
  List<Object> get props => [location];
}
