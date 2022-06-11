import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_search_bloc.dart';
import '../widgets/show_search_seather_widget.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({Key? key}) : super(key: key);

  @override
  State<WeatherSearchPage> createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Search")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShowSearchResult(),
              const Text(
                "Search Weather",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text("Instanly", style: TextStyle(fontSize: 25)),
              const SizedBox(height: 15),
              _buildSearchField(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final q = cityController.text.trim();
                  if (q.isEmpty) return;

                  _search(q);
                },
                child: const Text("Search"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _search(String q) {
    context.read<WeatherSearchBloc>().add(WeatherSearchEventSearch(q));
  }

  Widget _buildSearchField() {
    return TextFormField(
      controller: cityController,
      keyboardType: TextInputType.name,
      validator: (String? v) {
        if (v == null || v.isEmpty) return "Enter city name";
        return null;
      },
      onChanged: (String v) {},
      onFieldSubmitted: (String s) {
        if (s.isEmpty) return;
        _search(s.trim());
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
    );
  }
}
