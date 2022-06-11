import '../.env.dart';

class RemoteUrls {
  static const String domainName = "api.openweathermap.org";

  static String searchApi(String q) => domainName + '?q=$q&APPID=${Env.mapKey}';

  static String iconUrl(String iconName) {
    return 'https://openweathermap.org/img/wn/$iconName@2x.png';
  }
}
