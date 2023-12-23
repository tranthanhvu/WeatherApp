import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/cubits/weather/weather_cubit.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/ui/weather_detail/widgets/weather_condition_image.dart';
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

  Weather? _weather;

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
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          TextButton(
            onPressed: _onAdd,
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: BlocConsumer<WeatherCubit, WeatherState>(
            bloc: _weatherCubit,
            listener: (context, state) {
              if (state is WeatherDataState) {
                _weather = state.weather;
              } else if (state is WeatherAdded || state is WeatherDeleted) {
                context.goNamed(ScreenDefine.home.name);
              }
            },
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
                        child: WeatherConditionImage(
                          condition: state.weather.current!.condition!,
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

  _onAdd() {
    if (_weather == null) return;

    _weatherCubit.addWeather(_weather!);
  }

  _onDelete() {
    if (_weather == null) return;

    _weatherCubit.deleteWeather(_weather!);
  }
}
