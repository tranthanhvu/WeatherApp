import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/services/hive_type_id.dart';

part 'weather_condition.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeId.weatherCondition)
@CopyWith()
class WeatherCondition extends Equatable {
  const WeatherCondition({
    this.text,
    this.icon,
    this.code,
  });

  @HiveField(0)
  @JsonKey(name: 'text')
  final String? text;

  @HiveField(1)
  @JsonKey(name: 'icon')
  final String? icon;

  @HiveField(2)
  @JsonKey(name: 'code')
  final int? code;

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);

  @override
  List<Object?> get props => [
        text,
        icon,
        code,
      ];
}
