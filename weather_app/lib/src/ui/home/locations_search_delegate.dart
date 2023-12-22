import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubits/search_location/search_location_cubit.dart';
import 'package:weather_app/src/ui/home/widgets/locations_widget.dart';

class LocationsSearchDelegate extends SearchDelegate {
  final Widget _content = const LocationsWidget();

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
    return _content;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<SearchLocationCubit>().search(text: query);
    return _content;
  }
}
