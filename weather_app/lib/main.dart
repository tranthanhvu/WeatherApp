import 'package:flutter/material.dart';
import 'package:weather_app/src/services/hive_db.dart';
import 'package:weather_app/src/services/weather_api.dart';

import 'src/app.dart';

void main() async {
  final api = WeatherAPI.standard();
  await HiveDB.shared.init();

  runApp(MyApp(
    api: api,
    db: HiveDB.shared,
  ));
}
