import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_search_event.dart';
part 'weather_search_state.dart';

class WeatherSearchBloc extends Bloc<WeatherSearchEvent, WeatherSearchState> {
  WeatherSearchBloc() : super(WeatherSearchInitial()) {
    on<WeatherSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
