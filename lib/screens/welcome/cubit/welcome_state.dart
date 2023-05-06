part of 'welcome_cubit.dart';

class WelcomeState extends Equatable {
  final int index;
  const WelcomeState({this.index = 0});

  @override
  List<Object> get props => [index];

  WelcomeState copyWith({
    int? index,
  }) {
    return WelcomeState(
      index: index ?? this.index,
    );
  }
}
