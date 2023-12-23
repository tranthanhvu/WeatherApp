import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubits/settings/settings_cubit.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/ui/weather_detail/widgets/weather_condition_image.dart';
import 'package:weather_app/src/utilities/formatter.dart';
import 'package:weather_app/src/utilities/gaps.dart';
import 'package:weather_app/src/utilities/text_styles.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({
    super.key,
    required this.weather,
    this.onTap,
  });

  final Weather weather;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather.location.name,
                  style: TextStyles.bodyBold,
                ),
                Gaps.px12,
                Row(
                  children: [
                    WeatherConditionImage(
                      condition: weather.current!.condition!,
                      imageSize: 64,
                    ),
                    Gaps.px12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.temperatureUnit == TemperatureUnit.celsius
                                ? '${weather.current!.tempC}${state.temperatureUnit.unit}'
                                : '${weather.current!.tempF}${state.temperatureUnit.unit}',
                          ),
                          Text(
                            weather.current!.condition?.text ?? '--',
                          ),
                          Text(
                            'Updated ${Formatter.ddMMyyyyHmm.format(DateTime.fromMillisecondsSinceEpoch(
                              weather.current!.lastUpdatedEpoch * 1000,
                            ))}',
                            style: TextStyles.caption1Regular.copyWith(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
