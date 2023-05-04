part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class PageChanged extends HomeEvent {
  final int index;

  List<Object> get props => [index];

  const PageChanged(this.index);
}
