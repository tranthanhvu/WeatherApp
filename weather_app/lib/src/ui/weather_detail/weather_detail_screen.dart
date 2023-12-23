import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/generated/assets.gen.dart';
import 'package:weather_app/src/cubits/weather/weather_cubit.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';
import 'package:weather_app/src/utilities/formatter.dart';
import 'package:weather_app/src/utilities/gaps.dart';

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
  late WeatherCubit _weatherCubit;
  final double imageSize = 128;

  @override
  void initState() {
    super.initState();

    final weatherRepo = context.read<WeatherRepo>();
    _weatherCubit = WeatherCubit(weatherRepo: weatherRepo);

    _weatherCubit.getWeather(widget.location);
  }

  @override
  void dispose() {
    _weatherCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: BlocConsumer<WeatherCubit, WeatherState>(
            bloc: _weatherCubit,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is WeatherDataState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gaps.px24,
                    Text(
                      state.weather.location.name,
                      textAlign: TextAlign.center,
                    ),
                    if (state.weather.current == null)
                      const Text('--')
                    else ...[
                      Center(
                        child: FadeInImage.assetNetwork(
                          width: imageSize,
                          height: imageSize,
                          fadeOutDuration: const Duration(milliseconds: 100),
                          fadeInDuration: const Duration(milliseconds: 300),
                          placeholder: Assets.images.defaultImage.path,
                          image:
                              'https:${state.weather.current!.condition!.icon}',
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Assets.images.defaultImage.image();
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '${state.weather.current!.tempC}',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        state.weather.current!.condition?.text ?? '--',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Updated ${Formatter.ddMMyyyyHmm.format(DateTime.fromMillisecondsSinceEpoch(
                          state.weather.current!.lastUpdatedEpoch * 1000,
                        ))}',
                        textAlign: TextAlign.center,
                      )
                    ]
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Future _onRefresh() async {
    _weatherCubit.getWeather(widget.location);
  }
}
