import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/ui/home/home_screen.dart';
import 'package:weather_app/src/ui/settings/settings_screen.dart';

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
    ],
  ),
]);
