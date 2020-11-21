import 'package:doe_sangue/Models/LoginData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // final LoginData _user;

  Future<String> checkUserState() async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      notifyListeners();
      return user.uid;

    } catch (e) {
      print(e);
      throw(e);
    }

  }

  void signOut() {
    try {
      _auth.signOut();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<String> signIn(LoginData loginData) async {

    try {
      final AuthResult authResult = await _auth.signInWithEmailAndPassword(
                                            email: loginData.email,
                                            password: loginData.password);
      final FirebaseUser user = authResult.user;
      notifyListeners();
      return user.uid;
    } catch (e) {
        notifyListeners();
        throw(e);
    }
  }

  Future<String> register(LoginData loginData) async {
    try {
      final AuthResult authResult = await _auth.createUserWithEmailAndPassword(
                                                  email: loginData.email,
                                                  password: loginData.password);

      final FirebaseUser user = authResult.user;
      notifyListeners();
      return user.uid;
    } catch (e) {
      notifyListeners();
      throw(e);
    }
  }

}