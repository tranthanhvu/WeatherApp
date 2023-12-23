import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/services/hive_type_id.dart';

part 'location.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeId.location)
@CopyWith()
class Location extends Equatable {
  const Location({
    this.id,
    required this.name,
    required this.lat,
    required this.lon,
    required this.region,
    required this.country,
  });

  @HiveField(0)
  @JsonKey(name: 'id')
  final int? id;

  @HiveField(1)
  @JsonKey(name: 'name')
  final String name;

  @HiveField(2)
  @JsonKey(name: 'lat')
  final double lat;

  @HiveField(3)
  @JsonKey(name: 'lon')
  final double lon;

  @HiveField(4)
  @JsonKey(name: 'region', defaultValue: '')
  final String region;

  @HiveField(5)
  @JsonKey(name: 'country', defaultValue: '')
  final String country;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        lat,
        lon,
        region,
        country,
      ];
}
