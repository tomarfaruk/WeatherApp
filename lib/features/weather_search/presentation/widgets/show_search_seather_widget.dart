import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_search_bloc.dart';
import 'flare_animation_widget.dart';
import 'loaded_weather_widget.dart';

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherSearchBloc, WeatherSearchState>(
      builder: (context, state) {
        if (state is WeatherSearchStateInitial) {
          return const FlareAnimationWidget();
        }
        if (state is WeatherSearchStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WeatherSearchStateLoaded) {
          return LoadedWeatherWidget(weather: state.searchWeatherEntity);
        }
        if (state is WeatherSearchStateError) {
          return Text(
            state.errorMessage,
            style: const TextStyle(color: Colors.red),
          );
        }
        return const SizedBox();
      },
    );
  }
}
