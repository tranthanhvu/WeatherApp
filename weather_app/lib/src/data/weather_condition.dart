import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_condition.g.dart';

@JsonSerializable()
class WeatherCondition extends Equatable {
  const WeatherCondition({
    this.text,
    this.icon,
    this.code,
  });

  @JsonKey(name: 'text')
  final String? text;

  @JsonKey(name: 'icon')
  final String? icon;

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
