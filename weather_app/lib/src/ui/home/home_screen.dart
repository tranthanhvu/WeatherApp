import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/cubits/home/home_cubit.dart';
import 'package:weather_app/src/data/weather.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/ui/home/locations_search_delegate.dart';
import 'package:weather_app/src/ui/home/widgets/weather_tile.dart';
import 'package:weather_app/src/utilities/gaps.dart';
import 'package:weather_app/src/utilities/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();

    _homeCubit = context.read<HomeCubit>();
    _homeCubit.update();
  }

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
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.e != null && state.e!.isNotEmpty) {
            Utils.showErrorMsg(state.e!);
          }
        },
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
              return _buildListView(context, list: list);
            },
          );
        },
      ),
    );
  }

  Widget _buildListView(BuildContext context, {required List<Weather> list}) {
    return RefreshIndicator(
      onRefresh: () async => await _onRefresh(context),
      child: ListView.separated(
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
      ),
    );
  }

  _onSettingsPressed(BuildContext context) {
    context.pushNamed(ScreenDefine.settings.name);
  }

  Future _onRefresh(BuildContext context) async {
    await context.read<HomeCubit>().update();
  }
}
