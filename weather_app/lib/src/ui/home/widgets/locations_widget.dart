import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/cubits/search_location/search_location_cubit.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/utilities/gaps.dart';

class LocationsWidget extends StatelessWidget {
  const LocationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchLocationCubit, SearchLocationState>(
        builder: (context, state) {
      if (state is SearchLocationSuccess) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final location = state.locations[index];

            final title = [location.name, location.country]
                .where((element) => element.isNotEmpty)
                .join(', ');

            return ListTile(
              title: Text(title),
              onTap: () {
                context.pushNamed(
                  ScreenDefine.weatherDetail.name,
                  extra: location,
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return Gaps.px12;
          },
          itemCount: state.locations.length,
        );
      }

      return const SizedBox();
    });
  }
}
