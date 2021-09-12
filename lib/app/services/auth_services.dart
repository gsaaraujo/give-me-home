import 'package:firebase_auth/firebase_auth.dart';
import 'package:give_me_home/app/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel?> authStateChanges() {
    return _auth.authStateChanges().map((user) {
      if (user != null) {
        return UserModel(
            uid: user.uid, name: user.displayName, photoURL: user.photoURL);
      }

      return null;
    });
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    }
  }
}
