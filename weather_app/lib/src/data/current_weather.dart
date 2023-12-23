import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/weather_condition.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather extends Equatable {
  const CurrentWeather({
    required this.lastUpdatedEpoch,
    required this.tempC,
    required this.tempF,
    this.condition,
  });

  @JsonKey(name: 'last_updated_epoch')
  final int lastUpdatedEpoch;

  @JsonKey(name: 'temp_c')
  final double tempC;

  @JsonKey(name: 'temp_f')
  final double tempF;

  @JsonKey(name: 'condition')
  final WeatherCondition? condition;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        tempC,
        tempF,
        condition,
      ];
}
