part of 'fetch_weather_cubit.dart';

sealed class FetchWeatherState extends Equatable {
  const FetchWeatherState();

  @override
  List<Object> get props => [];
}

final class FetchWeatherInitial extends FetchWeatherState {}

final class FetchWeatherLoad extends FetchWeatherState {}

final class FetchWeatherSuccess extends FetchWeatherState {
  final Weather weather;

  const FetchWeatherSuccess({required this.weather}) : super();

  @override
  List<Object> get props => super.props..add(weather);
}

final class FetchWeatherError extends FetchWeatherState {
  final String e;

  const FetchWeatherError({
    required this.e,
  }) : super();

  @override
  List<Object> get props => super.props..add(e);
}
