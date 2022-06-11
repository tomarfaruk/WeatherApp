import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router_name.dart';
import 'features/weather_search/presentation/bloc/weather_search_bloc.dart';
import 'injector.dart' as injector;
import 'resources/k_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherSearchBloc>(
          create: (BuildContext context) => injector.sl<WeatherSearchBloc>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Kstrings.appName,
        // theme: MyTheme.theme,
        onGenerateRoute: RouteNames.generateRoute,
      ),
    );
  }
}
