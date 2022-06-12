// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:weather_app/core/network_checker/network_checker.dart';
// import 'package:weather_app/features/weather_search/data/datasources/weather_local_data_source.dart';
// import 'package:weather_app/features/weather_search/data/datasources/wiather_remote_data_source.dart';
// import 'package:weather_app/features/weather_search/data/models/search_weather_model.dart';
// import 'package:weather_app/features/weather_search/data/repositories/search_weather_repository_impl.dart';

// import '../../../mock_data/mock_data_reader.dart';

// class MockWeatherRemoteDataSource extends Mock
//     implements WeatherRemoteDataSource {}

// class MockWeatherLocalDataSource extends Mock
//     implements WeatherLocalDataSource {}

// class MockNetworkChecker extends Mock implements NetworkChecker {}

// void main() {
//   late SearchWeatherRepositoryImpl searchWeatherRepositoryImpl;
//   late MockNetworkChecker mockNetworkChecker;
//   late MockWeatherLocalDataSource mockWeatherLocalDataSource;
//   late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;

//   setUp(() {
//     mockNetworkChecker = MockNetworkChecker();
//     mockWeatherLocalDataSource = MockWeatherLocalDataSource();
//     mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();

//     searchWeatherRepositoryImpl = SearchWeatherRepositoryImpl(
//         dataSource: mockWeatherRemoteDataSource,
//         networkChecker: mockNetworkChecker,
//         localDataSource: mockWeatherLocalDataSource);
//   });

//   const mockdataUrl = 'weather_data.json';
//   final testJson = mockDataReader(mockdataUrl);
//   final weatherResponse = WeatherSearchResponseModel.fromJson(testJson);
//   const mockLocation = "Naogaon";

//   test(
//     'should check if the device is online',
//     () async {
//       // arrange
//       when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);
//       // act
//       searchWeatherRepositoryImpl.getWeather('q');
//       // assert
//       verify(mockNetworkChecker.isConnected);
//     },
//   );
//   group("Device is online", () {
//     setUp(() {
//       when(() => mockNetworkChecker.isConnected())
//           .thenAnswer((s) => Future.value(true));
//     });

//     test(
//       'get remote data source is successful',
//       () async {
//         // arrange
//         when(() => mockWeatherRemoteDataSource.searchWeather(mockLocation))
//             .thenAnswer((_) async => weatherResponse);
//         // act
//         final result =
//             await searchWeatherRepositoryImpl.getWeather(mockLocation);
//         // assert
//         verify(() => searchWeatherRepositoryImpl.getWeather(mockLocation));
//         expect(result, equals(Right(weatherResponse.toEntity())));
//       },
//     );
//   });
// }
