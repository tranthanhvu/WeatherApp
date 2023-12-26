import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/data/weather_condition.dart';

void main() {
  group('WeatherCondition', () {
    test('creates a WeatherCondition object from json successfully', () {
      expect(
        WeatherCondition.fromJson(
          const <String, dynamic>{
            "text": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
            "code": 1003
          },
        ),
        const WeatherCondition(
          text: "Partly cloudy",
          icon: "//cdn.weatherapi.com/weather/64x64/night/116.png",
          code: 1003,
        ),
      );
    });
  });
}
