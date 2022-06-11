part of 'weather_search_bloc.dart';

abstract class WeatherSearchState extends Equatable {
  const WeatherSearchState();

  @override
  List<Object> get props => [];
}

class WeatherSearchStateInitial extends WeatherSearchState {}

class WeatherSearchStateLoading extends WeatherSearchState {}

class WeatherSearchStateLoaded extends WeatherSearchState {
  final SearchWeatherEntity searchWeatherEntity;

  const WeatherSearchStateLoaded(this.searchWeatherEntity);

  @override
  List<Object> get props => [searchWeatherEntity];
}

class WeatherSearchStateError extends WeatherSearchState {
  final String errorMessage;
  const WeatherSearchStateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
