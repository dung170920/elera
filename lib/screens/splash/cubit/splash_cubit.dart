import 'dart:async';
import 'package:elera/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  StreamSubscription<User?>? _userSubscription;
  final AuthService authService;
  final UserService userService;

  SplashCubit(
      {required AuthService authService, required UserService userService})
      : authService = authService,
        userService = userService,
        super(
            // authService.currentUser.isNotEmpty
            //     ? SplashState.authenticated(authService.currentUser)
            //     : SplashState.unAuthenticated(),
            SplashState.unAuthenticated()) {
    _userSubscription = authService.user.listen(
      (firebaseUser) async {
        var user = await userService.getUserById(firebaseUser?.uid ?? "");
        print('user: $user');
        onAuthUserChanged(user);
      },
    );
  }

  void onAuthUserChanged(user) => emit(
        user.isNotEmpty
            ? SplashState.authenticated(user)
            : SplashState.unAuthenticated(),
      );

  void onAuthLogoutRequested() => unawaited(authService.logOut());

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
