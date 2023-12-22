import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/current_weather.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather_condition.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.location,
    required this.current,
  });

  @JsonKey(name: 'location')
  final Location location;

  @JsonKey(name: 'current')
  final CurrentWeather current;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [
        location,
        current,
      ];
}
