import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/weather_condition.dart';
import 'package:weather_app/src/services/hive_type_id.dart';

part 'current_weather.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeId.currentWeather)
@CopyWith()
class CurrentWeather extends Equatable {
  const CurrentWeather({
    required this.lastUpdatedEpoch,
    required this.tempC,
    required this.tempF,
    this.condition,
  });

  @HiveField(0)
  @JsonKey(name: 'last_updated_epoch')
  final int lastUpdatedEpoch;

  @HiveField(1)
  @JsonKey(name: 'temp_c')
  final double tempC;

  @HiveField(2)
  @JsonKey(name: 'temp_f')
  final double tempF;

  @HiveField(3)
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
