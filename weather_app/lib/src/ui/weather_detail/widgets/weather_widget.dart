import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/src/cubits/settings/settings_cubit.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/ui/weather_detail/widgets/weather_condition_image.dart';
import 'package:weather_app/src/utilities/formatter.dart';
import 'package:weather_app/src/utilities/gaps.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.weather,
    required this.temperatureUnit,
  });

  final Weather weather;
  final TemperatureUnit temperatureUnit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Gaps.px24,
          Text(
            weather.location.name,
            textAlign: TextAlign.center,
          ),
          if (weather.current == null)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: CircularProgressIndicator(),
              ),
            )
          else ...[
            Center(
              child: WeatherConditionImage(
                condition: weather.current!.condition!,
              ),
            ),
            Text(
              temperatureUnit == TemperatureUnit.celsius
                  ? '${weather.current!.tempC}${temperatureUnit.unit}'
                  : '${weather.current!.tempF}${temperatureUnit.unit}',
              textAlign: TextAlign.center,
            ),
            Text(
              weather.current!.condition?.text ?? '--',
              textAlign: TextAlign.center,
            ),
            Text(
              'Updated ${Formatter.ddMMyyyyHmm.format(DateTime.fromMillisecondsSinceEpoch(
                weather.current!.lastUpdatedEpoch * 1000,
              ))}',
              textAlign: TextAlign.center,
            )
          ]
        ],
      ),
    );
  }
}
