part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ValueListenable<Box<Weather>> stream;
  final LoadingStatus loadingStatus;
  final String? e;

  const HomeState({
    required this.stream,
    this.loadingStatus = LoadingStatus.none,
    this.e,
  });

  HomeState copyWith({
    ValueListenable<Box<Weather>>? stream,
    LoadingStatus? loadingStatus,
    String? e,
  }) {
    return HomeState(
      stream: stream ?? this.stream,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      e: e,
    );
  }

  @override
  List<Object?> get props => [
        stream,
        loadingStatus,
      ];
}
