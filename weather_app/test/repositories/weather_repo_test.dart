import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/config/config.dart';
import 'package:weather_app/src/error/app_exception.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';
import 'package:weather_app/src/services/hive_db.dart';
import 'package:weather_app/src/services/weather_api.dart';

import '../data/mock_data.dart';

class MockWeatherAPI extends Mock implements WeatherAPI {}

class MockHiveDB extends Mock implements HiveDB {}

void main() {
  group('WeatherRepo', () {
    late WeatherAPI mockApi;
    late HiveDB mockDB;
    late WeatherRepo weatherRepo;

    setUp(() async {
      await Config.setEnvironment();

      mockApi = MockWeatherAPI();
      mockDB = MockHiveDB();

      weatherRepo = WeatherRepo(api: mockApi, db: mockDB);
    });

    group('constructor', () {
      test('can create WeatherRepo obj', () {
        expect(WeatherRepo(api: mockApi, db: mockDB), isNotNull);
      });
    });

    group('getWeather', () {
      test(
          'throws an exception of invalid params while searching text is empty',
          () async {
        final response = await weatherRepo.getWeather(q: '');

        expect(response.isError(), true);
        expect(response.tryGetError(),
            const AppException(AppErrorCode.invalidParams));
      });

      test('returns correct weather on success', () async {
        when(() => mockApi.getWeather(apiKey: Config.apiKey, q: 'hanoi'))
            .thenAnswer(
          (_) async => MockData.hanoiWeather,
        );

        final response = await weatherRepo.getWeather(q: 'hanoi');

        expect(response.isSuccess(), true);
        expect(response.tryGetSuccess(), MockData.hanoiWeather);
      });

      test('throws an exception if there is an error', () async {
        when(() => mockApi.getWeather(apiKey: Config.apiKey, q: 'throwError'))
            .thenThrow(
          DioException.sendTimeout(
            timeout: const Duration(seconds: 60),
            requestOptions: RequestOptions(),
          ),
        );

        final response = await weatherRepo.getWeather(q: 'throwError');

        expect(response.isError(), true);
        expect(response.tryGetError(), isA<DioException>());
      });
    });

    group('updateWeatherForAll', () {
      test('calls getWeather to update current weather for all locations',
          () async {
        const numberOfWeatherObj = 4;

        // generate weather objects
        when(() => mockDB.getWeathers()).thenReturn(Iterable.generate(
          numberOfWeatherObj,
          (index) => MockData.hanoiWeather,
        ).toList());

        // mock the function which is used to fetch weather
        when(
          () => mockApi.getWeather(apiKey: Config.apiKey, q: any(named: 'q')),
        ).thenAnswer(
          (_) async => MockData.hanoiWeather,
        );

        await weatherRepo.updateWeatherForAll();

        verify(
          () => mockApi.getWeather(apiKey: Config.apiKey, q: any(named: 'q')),
        ).called(numberOfWeatherObj);
      });
    });
  });
}
