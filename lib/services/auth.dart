import 'package:brew_crew/models/user.dart' as md;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create User obj based on Firebase user
  md.UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? md.UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<md.UserModel?> get user {
    return _auth
        .authStateChanges()
        //.map((User? usr) => _userFromFirebaseUser(usr)); same as bellow ↧↧↧
        .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signAnonym() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  //sign in with email & password
 Future signIn(String email, String password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(res.user);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
  //register in with email & password
  Future register(String email, String password) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(res.user);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
