import 'dart:async';
import 'package:elera/constants/constants.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  StreamSubscription<UserModel>? _userSubscription;
  final AuthService authService;

  SplashCubit({required AuthService authService})
      : authService = authService,
        super(
          authService.currentUser.isNotEmpty
              ? SplashState.authenicated(authService.currentUser)
              : SplashState.unAuthenticated(),
        ) {
    _userSubscription = authService.user.listen(
      (user) async {
        print('user: $user');
        onAuthUserChanged(user);
      },
    );
  }

  void onAuthUserChanged(user) => emit(
        user.isNotEmpty
            ? SplashState.authenicated(user)
            : SplashState.unAuthenticated(),
      );

  void onAuthLogoutRequested() => unawaited(authService.logOut());

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
