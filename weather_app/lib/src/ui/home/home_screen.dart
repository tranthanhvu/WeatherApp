import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/ui/home/locations_search_delegate.dart';
import 'package:weather_app/src/ui/home/widgets/weather_tile.dart';
import 'package:weather_app/src/utilities/gaps.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weathers'),
        leading: IconButton(
          onPressed: () => _onSettingsPressed(context),
          icon: const Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
                context: context, delegate: LocationsSearchDelegate()),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return const WeatherTile(
                name: 'name',
                temperature: 'temperature',
                weatherCondition: 'weatherCondition',
              );
            },
            separatorBuilder: (context, index) {
              return Gaps.px12;
            },
            itemCount: 1,
          ))
        ],
      ),
    );
  }

  _onSettingsPressed(BuildContext context) {
    context.pushNamed(ScreenDefine.settings.name);
  }
}
