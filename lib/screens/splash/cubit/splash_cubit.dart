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

  SplashCubit({required AuthService authService})
      : authService = authService,
        super(SplashState.unAuthenticated()) {
    _authTokenSubscription = authService.accessToken.listen((token) {
      print("token: $token");
      onAuthUserChanged(token);
    });
  }

  void onAuthUserChanged(String token) async {
    if (token.isNotEmpty) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      emit(SplashState.authenticated(UserModel.fromJson(decodedToken), token));
    } else {
      emit(SplashState.unAuthenticated());
    }
  }

  void onAuthLogoutRequested() {
    unawaited(authService.logOut());
  }

  @override
  Future<void> close() {
    _authTokenSubscription.cancel();
    return super.close();
  }
}
