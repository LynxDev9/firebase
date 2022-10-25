import 'package:brew_crew/models/user.dart' as md;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create User obj based on Firebase user
  md.User? _userFromFirebaseUser(User? user) {
    return user != null ? md.User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<md.User?> get user {
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

  //register in with email & password

  //sign out

}
