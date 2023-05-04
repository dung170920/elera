import 'dart:async';
import 'package:elera/models/models.dart';
import 'package:elera/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { authenticated, unAuthenticated }

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
      throw FirebaseAuthExceptions.fromCode(e.code);
    } catch (_) {
      throw FirebaseAuthExceptions();
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions.fromCode(e.code);
    } catch (e) {
      throw FirebaseAuthExceptions();
    }
  }

  Future<void> logOut() async {
    try {
      Future.wait([
        firebaseAuth.signOut(),
      ]);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions.fromCode(e.code);
    } catch (e) {
      throw FirebaseAuthExceptions();
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
