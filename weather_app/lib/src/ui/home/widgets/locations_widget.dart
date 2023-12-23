import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubits/search_location/search_location_cubit.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/utilities/gaps.dart';

class LocationsWidget extends StatelessWidget {
  const LocationsWidget({super.key, required this.onLocationSelected});

  final Function(Location)? onLocationSelected;

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
                onLocationSelected?.call(location);
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
