import 'package:weather_app/src/data/current_weather.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/data/weather_condition.dart';

class MockData {
  static const hanoiLocation = Location(
    id: 2717932,
    name: 'Hanoi',
    lat: 21.03,
    lon: 105.85,
    region: '',
    country: 'Vietnam',
  );

  static const hanoiCurrentWeather = CurrentWeather(
    lastUpdatedEpoch: 1703266200,
    tempC: 11,
    tempF: 51.8,
    condition: WeatherCondition(
      text: 'Partly cloudy',
      icon: "//cdn.weatherapi.com/weather/64x64/night/116.png",
      code: 1003,
    ),
  );

  static const hanoiWeather = Weather(
    location: hanoiLocation,
    current: hanoiCurrentWeather,
  );
}
