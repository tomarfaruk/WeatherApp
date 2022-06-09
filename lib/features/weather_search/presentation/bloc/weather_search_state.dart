part of 'weather_search_bloc.dart';

abstract class WeatherSearchState extends Equatable {
  const WeatherSearchState();  

  @override
  List<Object> get props => [];
}
class WeatherSearchInitial extends WeatherSearchState {}
