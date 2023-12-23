import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/data/current_weather.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required this.weatherRepo,
  }) : super(WeatherInitial());

  WeatherRepo weatherRepo;

  getWeather(Location location) async {
    CurrentWeather? currentWeather;

    if (state is WeatherDataState) {
      final weatherDataState = state as WeatherDataState;
      if (weatherDataState.status == LoadingStatus.loading) {
        return;
      }

      currentWeather = weatherDataState.weather.current;
    }

    emit(WeatherDataState(
      weather: Weather(
        location: location,
        current: currentWeather,
      ),
      status: LoadingStatus.loading,
    ));

    final response = await weatherRepo.getWeather(q: location.name);

    response.when((success) {
      emit((state as WeatherDataState).copyWith(
        status: LoadingStatus.success,
        weather: success,
      ));
    }, (error) {
      emit((state as WeatherDataState).copyWith(
        status: LoadingStatus.failure,
        e: error.toString(),
      ));
    });
  }
}
