// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CurrentWeatherCWProxy {
  CurrentWeather lastUpdatedEpoch(int lastUpdatedEpoch);

  CurrentWeather tempC(double tempC);

  CurrentWeather tempF(double tempF);

  CurrentWeather condition(WeatherCondition? condition);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CurrentWeather(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CurrentWeather(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrentWeather call({
    int? lastUpdatedEpoch,
    double? tempC,
    double? tempF,
    WeatherCondition? condition,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCurrentWeather.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCurrentWeather.copyWith.fieldName(...)`
class _$CurrentWeatherCWProxyImpl implements _$CurrentWeatherCWProxy {
  const _$CurrentWeatherCWProxyImpl(this._value);

  final CurrentWeather _value;

  @override
  CurrentWeather lastUpdatedEpoch(int lastUpdatedEpoch) =>
      this(lastUpdatedEpoch: lastUpdatedEpoch);

  @override
  CurrentWeather tempC(double tempC) => this(tempC: tempC);

  @override
  CurrentWeather tempF(double tempF) => this(tempF: tempF);

  @override
  CurrentWeather condition(WeatherCondition? condition) =>
      this(condition: condition);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CurrentWeather(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CurrentWeather(...).copyWith(id: 12, name: "My name")
  /// ````
  CurrentWeather call({
    Object? lastUpdatedEpoch = const $CopyWithPlaceholder(),
    Object? tempC = const $CopyWithPlaceholder(),
    Object? tempF = const $CopyWithPlaceholder(),
    Object? condition = const $CopyWithPlaceholder(),
  }) {
    return CurrentWeather(
      lastUpdatedEpoch: lastUpdatedEpoch == const $CopyWithPlaceholder() ||
              lastUpdatedEpoch == null
          ? _value.lastUpdatedEpoch
          // ignore: cast_nullable_to_non_nullable
          : lastUpdatedEpoch as int,
      tempC: tempC == const $CopyWithPlaceholder() || tempC == null
          ? _value.tempC
          // ignore: cast_nullable_to_non_nullable
          : tempC as double,
      tempF: tempF == const $CopyWithPlaceholder() || tempF == null
          ? _value.tempF
          // ignore: cast_nullable_to_non_nullable
          : tempF as double,
      condition: condition == const $CopyWithPlaceholder()
          ? _value.condition
          // ignore: cast_nullable_to_non_nullable
          : condition as WeatherCondition?,
    );
  }
}

extension $CurrentWeatherCopyWith on CurrentWeather {
  /// Returns a callable class that can be used as follows: `instanceOfCurrentWeather.copyWith(...)` or like so:`instanceOfCurrentWeather.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CurrentWeatherCWProxy get copyWith => _$CurrentWeatherCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentWeatherAdapter extends TypeAdapter<CurrentWeather> {
  @override
  final int typeId = 1;

  @override
  CurrentWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentWeather(
      lastUpdatedEpoch: fields[0] as int,
      tempC: fields[1] as double,
      tempF: fields[2] as double,
      condition: fields[3] as WeatherCondition?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentWeather obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lastUpdatedEpoch)
      ..writeByte(1)
      ..write(obj.tempC)
      ..writeByte(2)
      ..write(obj.tempF)
      ..writeByte(3)
      ..write(obj.condition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      lastUpdatedEpoch: json['last_updated_epoch'] as int,
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition: json['condition'] == null
          ? null
          : WeatherCondition.fromJson(
              json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition,
    };
