import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/cubits/home/home_cubit.dart';
import 'package:weather_app/src/data/weather.dart';
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
        title: const Text('Weather'),
        leading: IconButton(
          onPressed: () => _onSettingsPressed(context),
          icon: const Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: LocationsSearchDelegate(),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ValueListenableBuilder(
            valueListenable: state.stream,
            builder: (context, value, _) {
              if (value.values.isEmpty) {
                return const Center(
                  child: Text(
                    'You have not added any location yet',
                    textAlign: TextAlign.center,
                  ),
                );
              }

              List<Weather> list = value.values.toList();
              return _buildListView(list);
            },
          );
        },
      ),
    );
  }

  Widget _buildListView(List<Weather> list) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final weather = list[index];

        return WeatherTile(
          weather: weather,
          onTap: () {
            context.pushNamed(
              ScreenDefine.weatherDetail.name,
              extra: weather.location,
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return Gaps.px12;
      },
      itemCount: list.length,
    );
  }

  _onSettingsPressed(BuildContext context) {
    context.pushNamed(ScreenDefine.settings.name);
  }
}
