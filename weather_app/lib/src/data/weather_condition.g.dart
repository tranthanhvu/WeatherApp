// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_condition.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherConditionCWProxy {
  WeatherCondition text(String? text);

  WeatherCondition icon(String? icon);

  WeatherCondition code(int? code);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherCondition(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherCondition(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherCondition call({
    String? text,
    String? icon,
    int? code,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeatherCondition.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeatherCondition.copyWith.fieldName(...)`
class _$WeatherConditionCWProxyImpl implements _$WeatherConditionCWProxy {
  const _$WeatherConditionCWProxyImpl(this._value);

  final WeatherCondition _value;

  @override
  WeatherCondition text(String? text) => this(text: text);

  @override
  WeatherCondition icon(String? icon) => this(icon: icon);

  @override
  WeatherCondition code(int? code) => this(code: code);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherCondition(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherCondition(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherCondition call({
    Object? text = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
  }) {
    return WeatherCondition(
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
      icon: icon == const $CopyWithPlaceholder()
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as int?,
    );
  }
}

extension $WeatherConditionCopyWith on WeatherCondition {
  /// Returns a callable class that can be used as follows: `instanceOfWeatherCondition.copyWith(...)` or like so:`instanceOfWeatherCondition.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeatherConditionCWProxy get copyWith => _$WeatherConditionCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherConditionAdapter extends TypeAdapter<WeatherCondition> {
  @override
  final int typeId = 2;

  @override
  WeatherCondition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherCondition(
      text: fields[0] as String?,
      icon: fields[1] as String?,
      code: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherCondition obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) =>
    WeatherCondition(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$WeatherConditionToJson(WeatherCondition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
