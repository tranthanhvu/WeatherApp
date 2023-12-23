import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/repositories/temperature_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required this.temperatureRepo,
  }) : super(const SettingsState(temperatureUnit: TemperatureUnit.celsius));

  final TemperatureRepo temperatureRepo;

  loadData() {
    final currentUnit = temperatureRepo.getCurrentTemperature();
    emit(SettingsState(temperatureUnit: currentUnit));
  }

  changeTemperatureUnit(TemperatureUnit unit) {
    temperatureRepo.changeTemperatureUnit(unit);
    emit(SettingsState(temperatureUnit: unit));
  }
}
