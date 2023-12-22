import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/repositories/error_handler.dart';
import 'package:weather_app/src/services/base_weather_api.dart';

class WeatherRepo {
  const WeatherRepo({
    required this.api,
  });

  final BaseWeatherAPI api;

  Future<Result<Weather?, Exception>> getWeather({
    required String q,
  }) async {
    try {
      final apiKey = '7ef408e24cfa4fd1bda174128232212';

      if (q.isEmpty) {
        return const Success(null);
      }

      final response = await api.getWeather(
        apiKey: apiKey,
        q: q,
      );

      return Success(response);
    } catch (e) {
      return handleError(e);
    }
  }
}
