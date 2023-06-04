import 'dart:async';
import 'package:elera/constants/constants.dart';
import 'package:elera/utils/utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  var apiUrl = "auth";
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
  final _controller = StreamController<String>.broadcast();
  Stream<String> get accessToken async* {
    String token = Global.storageService.getString(Preferences.ACCESS_TOKEN);

    if (token.isEmpty) {
      yield "";
    } else {
      bool isExpired = JwtDecoder.isExpired(token);

      yield isExpired ? "" : token;
    }

    yield* _controller.stream;
  }

  void storeToken(String token) async {
    await Global.storageService.setString(Preferences.ACCESS_TOKEN, token);
    print("stored");
  }

  Future<void> signUp(params) =>
      DioManager().dio.post("$apiUrl/register", data: params).then((response) {
        _controller.sink.add(response.data['result']);
        storeToken(response.data['result']);
      }).catchError((error) {
        print(error.toString());
      });

  Future<void> signInWithEmailAndPassword(params) => DioManager()
          .dio
          .post("$apiUrl/login", data: params)
          .then((response) async {
        _controller.sink.add(response.data['result']);
        storeToken(response.data['result']);
      }).catchError((error) {
        print(error.toString());
      });

  // Future<void> logInWithGoogle() async {
  //   try {
  //     final googleUser = await _googleSignIn.signIn();
  //     final googleAuth = await googleUser!.authentication;
  //     // final credential = GoogleAuthProvider.credential(
  //     //   accessToken: googleAuth.accessToken,
  //     //   idToken: googleAuth.idToken,
  //     // );

  //     // await firebaseAuth.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     print(e.code);
  //     throw AppExceptions.fromCode(e.code);
  //   } catch (_) {
  //     throw const AppExceptions();
  //   }
  // }

  Future<void> logOut() async {
    try {
      Future.wait([
        Global.storageService.remove(Preferences.ACCESS_TOKEN),
        Global.storageService.remove(Preferences.REFRESH_TOKEN),
      ]);
      _controller.add("");
    } catch (e) {
      throw AppExceptions();
    }
  }
}
