import 'dart:async';
import 'package:elera/models/models.dart';
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

  Future<void> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      Future.wait([
        firebaseAuth.signOut(),
      ]);
    } catch (e) {
      print(e.toString());
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
    );
  }
}
