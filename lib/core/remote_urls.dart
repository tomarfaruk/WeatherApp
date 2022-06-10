import '../.env.dart';

class RemoteUrls {
  static const String rootUrl =
      "http://api.openweathermap.org/data/2.5/weather";

  static String searchApi(String q) => rootUrl + '?q=$q&APPID=${Env.mapKey}';
}
