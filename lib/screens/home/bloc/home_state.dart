part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int index;
  const HomeState({this.index = 0});

  @override
  List<Object> get props => [index];

  HomeState copyWith({
    int? index,
  }) {
    return HomeState(
      index: index ?? this.index,
    );
  }
}
