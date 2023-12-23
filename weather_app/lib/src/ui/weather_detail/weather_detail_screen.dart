import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/cubits/settings/settings_cubit.dart';
import 'package:weather_app/src/cubits/weather/weather_cubit.dart';
import 'package:weather_app/src/data/loading_status.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/ui/weather_detail/widgets/adding_widget.dart';
import 'package:weather_app/src/ui/weather_detail/widgets/deleting_widget.dart';
import 'package:weather_app/src/ui/weather_detail/widgets/weather_widget.dart';
import 'package:weather_app/src/utilities/utils.dart';

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
  late SettingsCubit _settingsCubit;

  Weather? _weather;

  @override
  void initState() {
    super.initState();

    final weatherRepo = context.read<WeatherRepo>();
    _weatherCubit = WeatherCubit(weatherRepo: weatherRepo);

    _weatherCubit.getWeather(widget.location);

    _settingsCubit = context.read<SettingsCubit>();
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
        title: Text(widget.location.name),
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        bloc: _weatherCubit,
        listener: (context, state) {
          if (state is WeatherDataState) {
            _weather = state.weather;
            if (state.e != null && state.e!.isNotEmpty) {
              Utils.showErrorMsg(state.e!);
            }
          } else if (state is WeatherAdded || state is WeatherDeleted) {
            context.goNamed(ScreenDefine.home.name);
          }
        },
        builder: (context, state) {
          if (state is WeatherDataState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: WeatherWidget(
                      weather: state.weather,
                      temperatureUnit: _settingsCubit.state.temperatureUnit,
                    ),
                  ),
                ),
                if (state.exist == false)
                  AddingWidget(
                      onPressed: state.status == LoadingStatus.loading
                          ? null
                          : () => _onAdd())
                else if (state.exist == true)
                  DeletingWidget(onPressed: _onDelete)
              ],
            );
          }

          return const SizedBox();
        },
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
