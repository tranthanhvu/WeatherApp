import 'package:flutter/material.dart';
import 'package:weather_app/src/data/location.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
    );
  }
}
