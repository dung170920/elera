import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  StreamSubscription<UserModel>? _userSubscription;
  final AuthService authService;
  SplashBloc({required AuthService authService})
      : authService = authService,
        super(authService.currentUser.isNotEmpty
            ? SplashState.authenicated(authService.currentUser)
            : SplashState.unAuthenticated()) {
    on<AuthUserChanged>((event, emit) {
      emit(
        event.user.isNotEmpty
            ? SplashState.authenicated(event.user)
            : SplashState.unAuthenticated(),
      );
    });

    on<AuthLogoutRequested>((event, emit) {
      unawaited(authService.logOut());
    });

    _userSubscription = authService.user.listen(
      (user) => add(AuthUserChanged(user)),
    );
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
