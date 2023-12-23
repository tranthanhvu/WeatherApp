import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/cubits/search_location/search_location_cubit.dart';
import 'package:weather_app/src/router/route_utils.dart';
import 'package:weather_app/src/ui/home/widgets/locations_widget.dart';

class LocationsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isEmpty) {
      return [];
    }

    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        context.read<SearchLocationCubit>().search(text: "");
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildWidget(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<SearchLocationCubit>().search(text: query);
    return _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    return LocationsWidget(onLocationSelected: (location) {
      context.pushNamed(
        ScreenDefine.weatherDetail.name,
        extra: location,
      );

      close(context, null);
    });
  }
}
