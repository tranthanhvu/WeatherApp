import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/ui/home/home_screen.dart';
import 'package:weather_app/src/ui/settings/settings_screen.dart';
import 'package:weather_app/src/ui/weather_detail/weather_detail_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: ScreenDefine.home.name,
    path: ScreenDefine.home.path,
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        name: ScreenDefine.settings.name,
        path: ScreenDefine.settings.path,
        pageBuilder: (context, state) {
          return const MaterialPage(
            fullscreenDialog: true,
            child: SettingsScreen(),
          );
        },
      ),
      GoRoute(
        name: ScreenDefine.weatherDetail.name,
        path: ScreenDefine.weatherDetail.path,
        pageBuilder: (context, state) {
          final location = state.extra as Location;

          return MaterialPage(
            fullscreenDialog: true,
            child: WeatherDetailScreen(location: location),
          );
        },
      ),
    ],
  ),
]);
