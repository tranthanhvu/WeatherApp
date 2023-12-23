import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/src/data/loading_status.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.weatherRepo})
      : super(HomeState(stream: weatherRepo.streamWeathers()));

  final WeatherRepo weatherRepo;

  update() async {
    if (state.loadingStatus == LoadingStatus.loading) {
      return;
    }

    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    final response = await weatherRepo.updateWeatherForAll();

    response.when(
      (success) {
        for (var weather in success) {
          weatherRepo.addOrUpdateWeather(weather);
        }

        emit(state.copyWith(loadingStatus: LoadingStatus.success));
      },
      (error) => emit(state.copyWith(
        loadingStatus: LoadingStatus.failure,
        e: error.toString(),
      )),
    );
  }
}
