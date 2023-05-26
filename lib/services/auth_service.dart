import 'dart:async';
import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();
  var currentUser = UserModel.empty;

  Stream<UserModel> get user {
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser?.toUser ?? UserModel.empty;
      currentUser = user;
      return user;
    });
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await user.user!.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      throw AppExceptions.fromCode(e.code);
    } catch (_) {
      throw AppExceptions();
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(await user.user!.getIdToken());
    } on FirebaseAuthException catch (e) {
      throw AppExceptions.fromCode(e.code);
    } catch (e) {
      throw AppExceptions();
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var user = await firebaseAuth.signInWithCredential(credential);
      print(await user.user!.getIdToken());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw AppExceptions.fromCode(e.code);
    } catch (_) {
      throw const AppExceptions();
    }
  }

  Future<void> logOut() async {
    try {
      Future.wait([
        firebaseAuth.signOut(),
      ]);
    } on FirebaseAuthException catch (e) {
      throw AppExceptions.fromCode(e.code);
    } catch (e) {
      throw AppExceptions();
    }
  }
}

extension on User {
  UserModel get toUser {
    return UserModel(
      id: uid,
      email: email,
      name: displayName,
      avatar: photoURL,
      phoneNumber: phoneNumber,
    );
  }
}
