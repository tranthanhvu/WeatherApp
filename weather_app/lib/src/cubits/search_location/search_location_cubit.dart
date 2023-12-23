import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/data/location.dart';
import 'package:weather_app/src/repositories/location_repo.dart';
import 'package:weather_app/src/utilities/debouncer.dart';

part 'search_location_state.dart';

class SearchLocationCubit extends Cubit<SearchLocationState> {
  SearchLocationCubit({
    required this.locationRepo,
  }) : super(SearchLocationInitial());

  final LocationRepo locationRepo;

  final List<Location> _locations = [];

  String? _searchText;
  Debouncer<String>? _debouncer;
  CancelToken? _cancelToken;

  search({required String text}) async {
    final newValue = text.isEmpty ? null : text.trim();

    _debouncer ??= Debouncer(onValue: (value) async {
      if (_searchText != value) {
        _searchText = value;
        getLocations();
      }
    });

    _debouncer!.value = newValue;
  }

  Future getLocations() async {
    if (state is SearchLocationLoading) {
      return;
    }

    emit(SearchLocationLoading());

    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final response = await locationRepo.searchLocations(
      q: _searchText ?? '',
      cancelToken: _cancelToken,
    );

    response.when(
      (success) {
        _locations.clear();
        _locations.addAll(success);

        emit(SearchLocationSuccess(locations: _locations));
      },
      (error) => emit(SearchLocationError(e: error.toString())),
    );
  }
}
