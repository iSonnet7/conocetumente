import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class AuthServices with ChangeNotifier {
  bool _isLoading = false;
  late String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(String email, String password) async {

    try{
      setLoadin(true);
      UserCredential authResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      setLoadin(false);
      return user;
    } on SocketException {
      setLoadin(false);
      setMessage("No existe una conexión a internet, favor de realizar una");
    } catch(e) {
      setLoadin(false);
      setMessage(e.toString());
    }
    notifyListeners();
  }

  Future login(String email, String password) async {
    setLoadin(true);
    try{
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      setLoadin(false);
      return user;
    } on SocketException {
      setLoadin(false);
      setMessage("No existe una conexión a internet, favor de realizar una");
    } catch(e) {
      setLoadin(false);
      setMessage(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }

  void setLoadin(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User?> get user =>
      firebaseAuth.authStateChanges();
}