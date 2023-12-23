// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LocationCWProxy {
  Location id(int? id);

  Location name(String name);

  Location lat(double lat);

  Location lon(double lon);

  Location region(String region);

  Location country(String country);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Location(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Location(...).copyWith(id: 12, name: "My name")
  /// ````
  Location call({
    int? id,
    String? name,
    double? lat,
    double? lon,
    String? region,
    String? country,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLocation.copyWith.fieldName(...)`
class _$LocationCWProxyImpl implements _$LocationCWProxy {
  const _$LocationCWProxyImpl(this._value);

  final Location _value;

  @override
  Location id(int? id) => this(id: id);

  @override
  Location name(String name) => this(name: name);

  @override
  Location lat(double lat) => this(lat: lat);

  @override
  Location lon(double lon) => this(lon: lon);

  @override
  Location region(String region) => this(region: region);

  @override
  Location country(String country) => this(country: country);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Location(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Location(...).copyWith(id: 12, name: "My name")
  /// ````
  Location call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? lat = const $CopyWithPlaceholder(),
    Object? lon = const $CopyWithPlaceholder(),
    Object? region = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
  }) {
    return Location(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      lat: lat == const $CopyWithPlaceholder() || lat == null
          ? _value.lat
          // ignore: cast_nullable_to_non_nullable
          : lat as double,
      lon: lon == const $CopyWithPlaceholder() || lon == null
          ? _value.lon
          // ignore: cast_nullable_to_non_nullable
          : lon as double,
      region: region == const $CopyWithPlaceholder() || region == null
          ? _value.region
          // ignore: cast_nullable_to_non_nullable
          : region as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
    );
  }
}

extension $LocationCopyWith on Location {
  /// Returns a callable class that can be used as follows: `instanceOfLocation.copyWith(...)` or like so:`instanceOfLocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LocationCWProxy get copyWith => _$LocationCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 0;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      id: fields[0] as int?,
      name: fields[1] as String,
      lat: fields[2] as double,
      lon: fields[3] as double,
      region: fields[4] as String,
      country: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lon)
      ..writeByte(4)
      ..write(obj.region)
      ..writeByte(5)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'] as int?,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      region: json['region'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'region': instance.region,
      'country': instance.country,
    };
