import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/current_weather.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/services/hive_type_id.dart';

part 'weather.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeId.weather)
@CopyWith()
class Weather extends Equatable {
  const Weather({
    required this.location,
    required this.current,
  });

  @HiveField(0)
  @JsonKey(name: 'location')
  final Location location;

  @HiveField(1)
  @JsonKey(name: 'current')
  final CurrentWeather? current;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [
        location,
        current,
      ];
}

extension WeatherExt on Weather {
  String get key {
    return '${location.lat}${location.lon}';
  }
}
