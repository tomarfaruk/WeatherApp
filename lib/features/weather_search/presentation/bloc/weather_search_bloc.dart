import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/features/weather_search/domain/entities/search_weather_entity.dart';
import 'package:weather_app/features/weather_search/domain/usecases/search_weather_usecase.dart';

part 'weather_search_event.dart';
part 'weather_search_state.dart';

class WeatherSearchBloc extends Bloc<WeatherSearchEvent, WeatherSearchState> {
  final SearchWeatherUsecase usecase;
  WeatherSearchBloc({required this.usecase})
      : super(WeatherSearchStateInitial()) {
    on<WeatherSearchEventSearch>(_searchEvent);
  }

  Future<void> _searchEvent(WeatherSearchEventSearch eventSearch,
      Emitter<WeatherSearchState> emit) async {
    emit(WeatherSearchStateLoading());
    // await Future.delayed(const Duration(seconds: 5));
    final result = await usecase(eventSearch.location);
    result.fold((failure) {
      emit(WeatherSearchStateError(failure.message));
    }, (data) {
      emit(WeatherSearchStateLoaded(data));
    });
  }
}
