import 'package:flutter/material.dart';
import 'package:weather_app/src/config/config.dart';
import 'package:weather_app/src/services/hive_db.dart';
import 'package:weather_app/src/services/weather_api.dart';

import 'src/app.dart';

void main() async {
  await Config.setEnvironment();

  final api = WeatherAPI.standard(Config.apiUrl);
  await HiveDB.shared.init();

  runApp(MyApp(
    api: api,
    db: HiveDB.shared,
  ));
}
