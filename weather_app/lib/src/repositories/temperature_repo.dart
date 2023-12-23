import 'package:weather_app/src/cubits/settings/settings_cubit.dart';
import 'package:weather_app/src/services/hive_db.dart';

class TemperatureRepo {
  TemperatureRepo({required this.db});

  final HiveDB db;

  TemperatureUnit getCurrentTemperature() {
    return db.isUsingTempC()
        ? TemperatureUnit.celsius
        : TemperatureUnit.faharenheit;
  }

  changeTemperatureUnit(TemperatureUnit type) {
    db.setIsUsingTempC(type == TemperatureUnit.celsius);
  }
}
