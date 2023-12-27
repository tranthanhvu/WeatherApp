import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/services/weather_api.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late WeatherAPI api;
  const apiKey = 'apiKey';

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: ''));
    dioAdapter = DioAdapter(
      dio: dio,
      matcher: const FullHttpRequestMatcher(),
    );
    api = WeatherAPI(dio);
  });

  group('Weather API', () {
    group('constructor', () {
      test('', () {
        expect(WeatherAPI.standard(''), isNotNull);
      });
    });

    group('searchLocations', () {
      const route = '/search.json';

      test('makes a correct request', () async {
        final jsonMock = [
          {
            "id": 2717932,
            "name": "Hanoi",
            "region": "",
            "country": "Vietnam",
            "lat": 21.03,
            "lon": 105.85,
            "url": "hanoi-vietnam"
          },
          {
            "id": 2567410,
            "name": "Hanover Park",
            "region": "Illinois",
            "country": "United States of America",
            "lat": 42,
            "lon": -88.15,
            "url": "hanover-park-illinois-united-states-of-america"
          },
        ];

        dioAdapter.onGet(
          route,
          (server) => server.reply(
            200,
            jsonMock,
            delay: const Duration(seconds: 1),
          ),
        );

        final response = await api.searchLocations(apiKey: apiKey, q: 'a');

        // expects returning 2 objects
        expect(response.length, 2);
      });

      test('throws a parsing exception', () async {
        final jsonMock = {"message": "An error", "code": 1000};

        dioAdapter.onGet(
          route,
          (server) => server.reply(
            200,
            jsonMock,
            delay: const Duration(seconds: 1),
          ),
        );

        expect(
          () async => await api.searchLocations(apiKey: apiKey, q: 'a'),
          throwsException,
        );
      });
    });

    group('getWeather', () {
      const route = '/current.json';

      test('makes a correct request', () async {
        final jsonMock = {
          "location": {
            "name": "London",
            "region": "City of London, Greater London",
            "country": "United Kingdom",
            "lat": 51.52,
            "lon": -0.11,
            "tz_id": "Europe/London",
            "localtime_epoch": 1703267062,
            "localtime": "2023-12-22 17:44"
          },
          "current": {
            "last_updated_epoch": 1703266200,
            "last_updated": "2023-12-22 17:30",
            "temp_c": 11,
            "temp_f": 51.8,
            "is_day": 0,
            "condition": {
              "text": "Partly cloudy",
              "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
              "code": 1003
            },
            "wind_mph": 17.4,
            "wind_kph": 28.1,
            "wind_degree": 290,
            "wind_dir": "WNW",
            "pressure_mb": 1014,
            "pressure_in": 29.94,
            "precip_mm": 0,
            "precip_in": 0,
            "humidity": 66,
            "cloud": 75,
            "feelslike_c": 8.1,
            "feelslike_f": 46.5,
            "vis_km": 10,
            "vis_miles": 6,
            "uv": 1,
            "gust_mph": 24.2,
            "gust_kph": 38.9
          }
        };

        dioAdapter.onGet(
          route,
          (server) => server.reply(
            200,
            jsonMock,
            delay: const Duration(seconds: 1),
          ),
        );

        final response = await api.getWeather(apiKey: apiKey, q: 'a');

        // expects returning 2 objects
        expect(response, isA<Weather>());
      });

      test('throws a parsing exception', () async {
        final jsonMock = {"message": "An error", "code": 1000};

        dioAdapter.onGet(
          route,
          (server) => server.reply(
            200,
            jsonMock,
            delay: const Duration(seconds: 1),
          ),
        );

        expect(
          () async => await api.getWeather(apiKey: apiKey, q: 'a'),
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
