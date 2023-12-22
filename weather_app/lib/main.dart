import 'package:flutter/material.dart';
import 'package:weather_app/src/services/weather_api.dart';

import 'src/app.dart';

void main() async {
  final api = WeatherAPI.standard();

  runApp(MyApp(api: api));
}
