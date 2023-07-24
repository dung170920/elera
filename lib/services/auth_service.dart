import 'dart:async';
import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  var apiUrl = "user";
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
  final _controller = StreamController<String>.broadcast();
  Stream<String> get accessToken async* {
    String accessToken =
        Global.storageService.getString(Preferences.ACCESS_TOKEN);
    print("authService: $accessToken");
    yield accessToken.isEmpty ? "" : accessToken;

    yield* _controller.stream;
  }

  Future<void> storeToken(TokensModel token) async {
    if (token.accessToken != null) {
      await Global.storageService
          .setString(Preferences.ACCESS_TOKEN, token.accessToken!);
    }

    if (token.refreshToken != null) {
      await Global.storageService
          .setString(Preferences.REFRESH_TOKEN, token.refreshToken!);
    }
  }

  Future<void> signUp(params) => DioManager()
          .dio
          .post("$apiUrl/register", data: params)
          .then((response) async {
        var result = ApiResponseModel<TokensModel>.fromJson(
            response.data, (data) => TokensModel.fromJson(data));
        _controller.sink.add(result.result.accessToken!);
        await storeToken(result.result);
      }).catchError((error) {
        print(error.toString());
      });

  Future<void> signInWithEmailAndPassword(params) => DioManager()
          .dio
          .post("$apiUrl/login", data: params)
          .then((response) async {
        var result = ApiResponseModel<TokensModel>.fromJson(
            response.data, (data) => TokensModel.fromJson(data));
        _controller.sink.add(result.result.accessToken!);
        await storeToken(result.result);
      }).catchError((error) {
        print(error.toString());
      });

  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );

      // await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw const AppExceptions();
    }
  }

  Future<ApiResponseModel<TokensModel>> getNewAccessToken(params) =>
      DioManager()
          .dio
          .post("$apiUrl/refresh-token", data: params)
          .then((response) async {
        var result = ApiResponseModel<TokensModel>.fromJson(
            response.data, (data) => TokensModel.fromJson(data));
        _controller.sink.add(result.result.accessToken!);
        await storeToken(result.result);
        return result;
      }).catchError((error) {
        print(error.toString());
      });

  Future<void> logOut() async {
    try {
      Future.wait([
        Global.storageService.remove(Preferences.ACCESS_TOKEN),
        Global.storageService.remove(Preferences.REFRESH_TOKEN),
        DioManager().dio.post("$apiUrl/logout")
      ]);
      _controller.add("");
    } catch (e) {
      throw AppExceptions();
    }
  }
}
