import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/data/current_weather.dart';
import 'package:weather_app/src/data/weather_condition.dart';

void main() {
  group('CurrentWeather', () {
    test('creates CurrentWeahter object from json successfully', () {
      expect(
        CurrentWeather.fromJson(
          const <String, dynamic>{
            "last_updated_epoch": 1703266200,
            "last_updated": "2023-12-22 17:30",
            "temp_c": 11,
            "temp_f": 51.8,
            "is_day": 0,
            "condition": {
              "text": "Partly cloudy",
              "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
              "code": 1003
            },
            "wind_mph": 17.4,
            "wind_kph": 28.1,
            "wind_degree": 290,
            "wind_dir": "WNW",
            "pressure_mb": 1014,
            "pressure_in": 29.94,
            "precip_mm": 0,
            "precip_in": 0,
            "humidity": 66,
            "cloud": 75,
            "feelslike_c": 8.1,
            "feelslike_f": 46.5,
            "vis_km": 10,
            "vis_miles": 6,
            "uv": 1,
            "gust_mph": 24.2,
            "gust_kph": 38.9
          },
        ),
        const CurrentWeather(
          lastUpdatedEpoch: 1703266200,
          tempC: 11,
          tempF: 51.8,
          condition: WeatherCondition(
            text: 'Partly cloudy',
            icon: '//cdn.weatherapi.com/weather/64x64/night/116.png',
            code: 1003,
          ),
        ),
      );
    });
  });
}
