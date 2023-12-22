import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/cubits/search_location/search_location_cubit.dart';
import 'package:weather_app/src/repositories/location_repo.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key});

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  late SearchLocationCubit _searchLocationCubit;
  final _searchController = SearchController();

  @override
  void initState() {
    super.initState();

    final locationRepo = context.read<LocationRepo>();
    _searchLocationCubit = SearchLocationCubit(locationRepo: locationRepo);
  }

  @override
  void dispose() {
    _searchLocationCubit.close();
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchLocationCubit, SearchLocationState>(
      bloc: _searchLocationCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return SearchAnchor(
          searchController: _searchController,
          builder: (context, controller) {
            return SearchBar(
              controller: _searchController,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16)),
              onTap: () {
                controller.openView();
              },
              onChanged: (value) {
                _searchLocationCubit.search(text: value);
                controller.openView();
              },
              onSubmitted: (value) {
                _searchLocationCubit.search(text: value);
                controller.openView();
              },
            );
          },
          suggestionsBuilder: (context, controller) {
            if (state is SearchLocationSuccess) {
              return List.generate(state.locations.length, (index) {
                final location = state.locations[index];
                return ListTile(
                  title: Text(
                    location.name,
                  ),
                  onTap: () {},
                );
              });
            }

            return List.generate(0, (index) => const SizedBox());
          },
        );
      },
    );
  }
}
