import 'dart:developer';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/remote_urls.dart';
import '../../domain/entities/search_weather_entity.dart';
import '../bloc/weather_search_bloc.dart';

class WeatherSearchPage extends StatelessWidget {
  const WeatherSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Search")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            // FlareAnimationWidget(),

            const ShowSearchResult(),
            const SizedBox(height: 8),
            const Text(
              "Search Weather",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Instanly",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: cityController,
              keyboardType: TextInputType.name,
              validator: (String? v) {
                if (v == null || v.isEmpty) return "Enter city name";
                return null;
              },
              onChanged: (String v) {},
              onFieldSubmitted: (s) {
                log(s);
                if (s.isEmpty) return;
                context
                    .read<WeatherSearchBloc>()
                    .add(WeatherSearchEventSearch(s));
              },
              decoration: const InputDecoration(
                isDense: true,
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(style: BorderStyle.solid)),
                hintText: "City Name",
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                final q = cityController.text.trim();
                if (q.isEmpty) return;

                context
                    .read<WeatherSearchBloc>()
                    .add(WeatherSearchEventSearch(q));
              },
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherSearchBloc, WeatherSearchState>(
      builder: (context, state) {
        log(state.toString());
        if (state is WeatherSearchStateInitial) {
          return const FlareAnimationWidget();
        }
        if (state is WeatherSearchStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WeatherSearchStateLoaded) {
          return ShowWeatherResultWidget(weather: state.searchWeatherEntity);
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

class ShowWeatherResultWidget extends StatelessWidget {
  const ShowWeatherResultWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final SearchWeatherEntity weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(RemoteUrls.iconUrl(weather.icon)),
        Text(
          '${weather.temp}°',
          style: const TextStyle(fontSize: 40),
        ),
        Text(weather.weatherDescription)
      ],
    );
  }
}

class FlareAnimationWidget extends StatelessWidget {
  const FlareAnimationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: 300,
      width: size.width,
      child: const FlareActor(
        "assets/WorldSpin.flr",
        fit: BoxFit.contain,
        animation: "roll",
      ),
    );
  }
}
