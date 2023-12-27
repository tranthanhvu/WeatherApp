import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/config/config.dart';
import 'package:weather_app/src/repositories/location_repo.dart';
import 'package:weather_app/src/services/weather_api.dart';

import '../data/mock_data.dart';

class MockWeatherAPI extends Mock implements WeatherAPI {}

void main() {
  group('LocationRepo', () {
    late WeatherAPI mockApi;
    late LocationRepo locationRepo;

    setUp(() {
      mockApi = MockWeatherAPI();
      locationRepo = LocationRepo(api: mockApi);
    });

    group('constructor', () {
      test('can create LocationRepo obj', () {
        expect(LocationRepo(api: mockApi), isNotNull);
      });
    });

    group('searchLocations', () {
      setUp(() async {
        await Config.setEnvironment();
      });

      test('returns [] immediately while the searching text is empty',
          () async {
        final response = await locationRepo.searchLocations(q: '');

        expect(response.isSuccess(), true);
        expect(response.tryGetSuccess(), []);
      });

      test('returns correct location on success', () async {
        when(() => mockApi.searchLocations(apiKey: Config.apiKey, q: 'hanoi'))
            .thenAnswer(
          (_) async => [MockData.hanoiLocation],
        );

        final response = await locationRepo.searchLocations(q: 'hanoi');

        expect(response.isSuccess(), true);
        expect(response.tryGetSuccess(), [MockData.hanoiLocation]);
      });

      test('throws an exception if there is an error', () async {
        when(() =>
                mockApi.searchLocations(apiKey: Config.apiKey, q: 'throwError'))
            .thenThrow(
          DioException.sendTimeout(
            timeout: const Duration(seconds: 60),
            requestOptions: RequestOptions(),
          ),
        );

        final response = await locationRepo.searchLocations(q: 'throwError');

        expect(response.isError(), true);
        expect(response.tryGetError(), isA<DioException>());
      });
    });
  });
}
