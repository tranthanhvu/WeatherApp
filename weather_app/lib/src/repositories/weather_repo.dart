import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/src/config/config.dart';
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
      final apiKey = Config.apiKey;

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

  bool isAdded(Weather weather) {
    final obj = db
        .getWeathers()
        .firstWhereOrNull((element) => element.key == weather.key);
    return obj != null;
  }

  Future<Result<List<Weather>, Exception>> updateWeatherForAll() async {
    try {
      final apiKey = Config.apiKey;

      final tasks = db
          .getWeathers()
          .map((e) => api.getWeather(apiKey: apiKey, q: e.location.name));

      final responses = await Future.wait(tasks);

      return Success(responses);
    } catch (e) {
      return handleError(e);
    }
  }
}
