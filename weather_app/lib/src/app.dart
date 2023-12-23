import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubits/home/home_cubit.dart';
import 'package:weather_app/src/cubits/search_location/search_location_cubit.dart';
import 'package:weather_app/src/cubits/settings/settings_cubit.dart';
import 'package:weather_app/src/repositories/location_repo.dart';
import 'package:weather_app/src/repositories/temperature_repo.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';
import 'package:weather_app/src/router/app_router.dart';
import 'package:weather_app/src/services/base_weather_api.dart';
import 'package:weather_app/src/services/hive_db.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.api,
    required this.db,
  });

  final BaseWeatherAPI api;
  final HiveDB db;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LocationRepo(api: api)),
        RepositoryProvider(create: (context) => WeatherRepo(api: api, db: db)),
        RepositoryProvider(create: (context) => TemperatureRepo(db: db)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchLocationCubit(
              locationRepo: context.read<LocationRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeCubit(
              weatherRepo: context.read<WeatherRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => SettingsCubit(
              temperatureRepo: context.read<TemperatureRepo>(),
            )..loadData(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
