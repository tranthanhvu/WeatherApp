part of 'settings_cubit.dart';

enum TemperatureUnit {
  faharenheit,
  celsius;

  String get unit {
    switch (this) {
      case TemperatureUnit.faharenheit:
        return '˚F';
      case TemperatureUnit.celsius:
        return '˚C';
    }
  }
}

class SettingsState extends Equatable {
  final TemperatureUnit temperatureUnit;

  const SettingsState({required this.temperatureUnit});

  @override
  List<Object> get props => [
        temperatureUnit,
      ];
}
