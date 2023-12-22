import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({
    super.key,
    required this.name,
    required this.temperature,
    required this.weatherCondition,
  });

  final String name;
  final String temperature;
  final String weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        Text(temperature),
        Text(weatherCondition),
      ],
    );
  }
}
