import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/src/data/current_weather.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/data/weather_condition.dart';

class HiveDB {
  static const kAppConfiguration = 'app_configuration';
  static const kUseTempC = 'use_temp_c';

  HiveDB._();
  static HiveDB shared = HiveDB._();

  late Box appData;
  late Box<Weather> weathers;

  init() async {
    Hive
      ..registerAdapter<Location>(LocationAdapter())
      ..registerAdapter<WeatherCondition>(WeatherConditionAdapter())
      ..registerAdapter<CurrentWeather>(CurrentWeatherAdapter())
      ..registerAdapter<Weather>(WeatherAdapter());

    await Hive.initFlutter();

    appData = await Hive.openBox('app_data').catchError(
      (error) async {
        Hive.deleteBoxFromDisk('app_data');
        return await Hive.openBox('app_data');
      },
    );

    weathers = await Hive.openBox<Weather>('weathers').catchError(
      (error) async {
        Hive.deleteBoxFromDisk('weathers');
        return await Hive.openBox<Weather>('weathers');
      },
    );
  }

  setIsUsingTempC(bool value) async => await appData.put(kUseTempC, value);
  bool isUsingTempC() => appData.get(kUseTempC) as bool? ?? true;

  Iterable<Weather> getWeathers() {
    return weathers.values;
  }

  deleteAll() async {
    await Future.wait([
      weathers.clear(),
    ]);
  }
}
