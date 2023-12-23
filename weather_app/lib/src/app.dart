import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubits/search_location/search_location_cubit.dart';
import 'package:weather_app/src/repositories/location_repo.dart';
import 'package:weather_app/src/repositories/weather_repo.dart';
import 'package:weather_app/src/router/app_router.dart';
import 'package:weather_app/src/services/base_weather_api.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.api,
  });

  final BaseWeatherAPI api;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LocationRepo(api: api)),
        RepositoryProvider(create: (context) => WeatherRepo(api: api)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchLocationCubit(
              locationRepo: context.read<LocationRepo>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
  }
}
