part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final AuthStatus status;
  final UserModel user;

  const SplashState._({
    required this.status,
    this.user = UserModel.empty,
  });

  SplashState.authenticated(UserModel user)
      : this._(
          status: AuthStatus.authenticated,
          user: user,
        );

  const SplashState.unAuthenticated()
      : this._(
          status: AuthStatus.unAuthenticated,
        );

  @override
  List<Object> get props => [status, user];
}
