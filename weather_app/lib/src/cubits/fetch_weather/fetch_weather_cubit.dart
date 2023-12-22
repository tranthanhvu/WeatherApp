import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_weather_state.dart';

class FetchWeatherCubit extends Cubit<FetchWeatherState> {
  FetchWeatherCubit() : super(FetchWeatherInitial());
}
