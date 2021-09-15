import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:give_me_home/app/services/auth_services.dart';

class LoginController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;
  bool isAuthFailed = false;

  Future<void> signInWithGoogle() async {
    try {
      isLoading = true;

      notifyListeners();

      await AuthServices(_auth, _firestore).signInWithGoogle();
    } catch (e) {
      isAuthFailed = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
