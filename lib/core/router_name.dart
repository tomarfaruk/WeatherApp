import 'package:flutter/material.dart';

class RouteNames {
  static const String onboardingScreen = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteNames.onboardingScreen:
      //   return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
