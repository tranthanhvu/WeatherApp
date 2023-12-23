part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {}

class WeatherDataState extends WeatherState {
  final Weather weather;
  final bool? exist;
  final LoadingStatus status;
  final String? e;

  const WeatherDataState({
    required this.weather,
    required this.status,
    required this.exist,
    this.e,
  }) : super();

  WeatherDataState copyWith({
    Weather? weather,
    LoadingStatus? status,
    bool? exist,
    String? e,
  }) {
    return WeatherDataState(
      weather: weather ?? this.weather,
      status: status ?? this.status,
      exist: exist ?? this.exist,
      e: e,
    );
  }

  @override
  List<Object?> get props => super.props
    ..addAll([
      weather,
      status,
      exist,
      e,
    ]);
}

class WeatherAdded extends WeatherState {}

class WeatherDeleted extends WeatherState {}
