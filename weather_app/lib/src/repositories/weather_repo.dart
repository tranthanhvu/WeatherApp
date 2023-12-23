import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/error/app_exception.dart';
import 'package:weather_app/src/repositories/error_handler.dart';
import 'package:weather_app/src/services/base_weather_api.dart';
import 'package:weather_app/src/services/hive_db.dart';

class WeatherRepo {
  const WeatherRepo({
    required this.api,
    required this.db,
  });

  final BaseWeatherAPI api;
  final HiveDB db;

  Future<Result<Weather, Exception>> getWeather({
    required String q,
  }) async {
    try {
      final apiKey = '7ef408e24cfa4fd1bda174128232212';

      if (q.isEmpty) {
        throw const AppException(AppErrorCode.invalidParams);
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

  ValueListenable<Box<Weather>> streamWeathers() {
    return db.weathers.listenable();
  }

  addOrUpdateWeather(Weather weather) async {
    await db.weathers.put(weather.key, weather);
  }

  deleteWeather(Weather weather) async {
    db.weathers.delete(weather.key);
  }
}
