part of 'weather_cubit.dart';

enum LoadingStatus { loading, success, failure }

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

class WeatherDataState extends WeatherState {
  final Weather weather;
  final LoadingStatus status;
  final String? e;

  const WeatherDataState({
    required this.weather,
    required this.status,
    this.e,
  }) : super();

  WeatherDataState copyWith({
    Weather? weather,
    LoadingStatus? status,
    String? e,
  }) {
    return WeatherDataState(
      weather: weather ?? this.weather,
      status: status ?? this.status,
      e: e,
    );
  }

  @override
  List<Object> get props => super.props..addAll([weather, status]);
}

class WeatherAdded extends WeatherState {}

class WeatherDeleted extends WeatherState {}
