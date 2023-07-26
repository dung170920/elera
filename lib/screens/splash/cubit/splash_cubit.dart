import 'dart:async';
import 'package:elera/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  late StreamSubscription<String> _authTokenSubscription;
  final AuthService authService;
  final UserService userService;

  SplashCubit({required this.authService, required this.userService})
      : super(SplashState.unAuthenticated()) {
    authService.accessToken.listen((token) {
      print("SplashCubit $token");
      onAuthUserChanged(token);
    });
  }

  void onAuthUserChanged(String token) async {
    if (token.isNotEmpty) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      print("decodedToken: $decodedToken");
      var result = await userService.getUserById(decodedToken['aud']);
      emit(SplashState.authenticated(result.result));
    } else {
      emit(SplashState.unAuthenticated());
    }
  }

  void onAuthLogoutRequested() async {
    await authService.logOut();
  }

  @override
  Future<void> close() {
    _authTokenSubscription.cancel();
    return super.close();
  }
}
