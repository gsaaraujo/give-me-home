import 'package:flutter/material.dart';
import 'package:give_me_home/app/services/auth_services.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;
  bool isAuthFailed = false;

  Future<void> signInWithGoogle() async {
    try {
      isLoading = true;

      notifyListeners();

      await AuthServices().signInWithGoogle();
    } catch (e) {
      isAuthFailed = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
