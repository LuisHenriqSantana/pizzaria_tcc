import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzaria_tcc/helpers/firebase_errors.dart';
import 'package:pizzaria_tcc/models/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseUser user;

  bool loading = false;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    setLoading(true);
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      this.user = result.user;

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    setLoading(false);
  }

  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      this.user = result.user;

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  void setLoading(bool value) {
    loading = value;
  }

  Future<void> _loadCurrentUser() async {
    FirebaseUser currentUser = await auth.currentUser();
    if (currentUser != null) {
      user = currentUser;
      print(user.uid);
    }
    notifyListeners();
  }
}
