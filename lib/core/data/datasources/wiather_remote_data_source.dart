import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../features/weather_search/data/models/search_weather_model.dart';
import '../../error/exception.dart';
import '../../remote_urls.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherSearchResponseModel> searchWeather(String q);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherSearchResponseModel> searchWeather(String q) async {
    try {
      final uri = Uri.parse(RemoteUrls.searchApi(q));

      final response = await client.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
      final responseJsonBody = _responseParser(response);

      return WeatherSearchResponseModel.fromMap(responseJsonBody);
    } on SocketException {
      throw NetworkException('Connection problem');
    } on FormatException {
      throw DataFormateException('Data formate exception');
    } on http.ClientException {
      throw NetworkException('Connection problem');

      ///un-comment in production mode
      // } on TypeError {
      //   throw ObjectToModelException(
      // "Object to model data class convert exception");
      // } catch (e) {
      //   print(e.runtimeType);
      //   print('error from remote data source file');
      //   throw UnknowException('Unknown error');
    }
  }
}

dynamic _responseParser(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException('Invalid request');
    case 401:
    case 402:
    case 403:
      throw UnauthorisedException('You are not unauthorised');
    case 422:
      final errorMsg = parsingError1(response.body);
      throw InvalidInputException(errorMsg);
    case 500:
      throw InternalServerException('Internal server error');

    default:
      throw FetchDataException('Error occured while communication with Server');
  }
}

String parsingError1(String body) {
  final errorsMap = json.decode(body);
  try {
    if (errorsMap['errors'] != null) {
      final errors = errorsMap['errors'] as Map;
      final firstErrorMsg = errors.values.first;
      if (firstErrorMsg is List) return firstErrorMsg.first;
      return firstErrorMsg.toString();
    }
    if (errorsMap['message'] != null) {
      return errorsMap['message'];
    }
  } catch (e) {
    log(e.toString());
  }
  return 'Unknown error';
}
