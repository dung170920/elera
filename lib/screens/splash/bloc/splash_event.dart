part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChanged extends SplashEvent {
  final UserModel user;

  const AuthUserChanged(this.user);

  @override
  List<Object> get props => [user];
}

class AuthLogoutRequested extends SplashEvent {}
