import 'package:dio/dio.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather.dart';

abstract class BaseWeatherAPI {
  Future<List<Location>> searchLocations({
    required String apiKey,
    required String q,
    CancelToken? cancelToken,
  });
  Future<Weather> getWeather({
    required String apiKey,
    required String q,
  });
}
