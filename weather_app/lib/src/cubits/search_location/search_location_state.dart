part of 'search_location_cubit.dart';

sealed class SearchLocationState extends Equatable {
  const SearchLocationState();

  @override
  List<Object> get props => [];
}

final class SearchLocationInitial extends SearchLocationState {}

final class SearchLocationLoading extends SearchLocationState {}

final class SearchLocationSuccess extends SearchLocationState {
  final List<Location> locations;

  const SearchLocationSuccess({required this.locations}) : super();

  @override
  List<Object> get props => super.props..add(locations);
}

final class SearchLocationError extends SearchLocationState {
  final String e;

  const SearchLocationError({
    required this.e,
  }) : super();

  @override
  List<Object> get props => super.props..add(e);
}
