part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ValueListenable<Box<Weather>> stream;

  const HomeState({required this.stream});

  @override
  List<Object?> get props => [stream];
}
