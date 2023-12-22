import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/repositories/error_handler.dart';
import 'package:weather_app/src/services/base_weather_api.dart';

class LocationRepo {
  const LocationRepo({
    required this.api,
  });

  final BaseWeatherAPI api;

  Future<Result<List<Location>, Exception>> searchLocations({
    required String q,
    CancelToken? cancelToken,
  }) async {
    try {
      final apiKey = '7ef408e24cfa4fd1bda174128232212';

      if (q.isEmpty) {
        return const Success([]);
      }

      final response = await api.searchLocations(
        apiKey: apiKey,
        q: q,
        cancelToken: cancelToken,
      );

      return Success(response);
    } catch (e) {
      return handleError(e);
    }
  }
}
