import 'package:dio/dio.dart';
import 'package:weather_app/src/data/location.dart';

abstract class BaseWeatherAPI {
  Future<List<Location>> searchLocations({
    required String apiKey,
    required String q,
    CancelToken? cancelToken,
  });
}
