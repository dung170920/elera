part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final AuthStatus status;
  final UserModel user;
  final String accessToken;

  const SplashState._({
    required this.status,
    this.user = UserModel.empty,
    this.accessToken = "",
  });

  SplashState.authenticated(UserModel user, String accessToken)
      : this._(
          status: AuthStatus.authenticated,
          user: user,
          accessToken: accessToken,
        );

  const SplashState.unAuthenticated()
      : this._(
          status: AuthStatus.unAuthenticated,
        );

  @override
  List<Object> get props => [status, user, accessToken];
}
