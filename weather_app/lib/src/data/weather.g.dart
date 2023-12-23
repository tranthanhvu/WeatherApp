// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherCWProxy {
  Weather location(Location location);

  Weather current(CurrentWeather? current);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Weather(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Weather(...).copyWith(id: 12, name: "My name")
  /// ````
  Weather call({
    Location? location,
    CurrentWeather? current,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeather.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeather.copyWith.fieldName(...)`
class _$WeatherCWProxyImpl implements _$WeatherCWProxy {
  const _$WeatherCWProxyImpl(this._value);

  final Weather _value;

  @override
  Weather location(Location location) => this(location: location);

  @override
  Weather current(CurrentWeather? current) => this(current: current);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Weather(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Weather(...).copyWith(id: 12, name: "My name")
  /// ````
  Weather call({
    Object? location = const $CopyWithPlaceholder(),
    Object? current = const $CopyWithPlaceholder(),
  }) {
    return Weather(
      location: location == const $CopyWithPlaceholder() || location == null
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as Location,
      current: current == const $CopyWithPlaceholder()
          ? _value.current
          // ignore: cast_nullable_to_non_nullable
          : current as CurrentWeather?,
    );
  }
}

extension $WeatherCopyWith on Weather {
  /// Returns a callable class that can be used as follows: `instanceOfWeather.copyWith(...)` or like so:`instanceOfWeather.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeatherCWProxy get copyWith => _$WeatherCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 3;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      location: fields[0] as Location,
      current: fields[1] as CurrentWeather?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.current);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };
