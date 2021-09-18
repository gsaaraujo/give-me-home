import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:give_me_home/app/models/user_model.dart';
import 'package:give_me_home/app/repositories/user_repository/user_repository.dart';
import 'package:give_me_home/app/repositories/favorite_repository/favorite_repository.dart';

class AuthServices {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthServices(this.auth, this.firestore);

  Stream<UserModel?> authStateChanges() {
    return auth.authStateChanges().map((user) {
      if (user != null) {
        return UserModel(
            uid: user.uid, name: user.displayName, photoURL: user.photoURL);
      }

      return null;
    });
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      try {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await auth.signInWithCredential(credential);
        await UserRepository(firestore, auth).createUserIfNotExists();
        await FavoriteRepository(firestore, auth).createFavoritesIfNotExists();
      } catch (e) {
        throw Exception('Authentication error');
      }
    }
  }

  Future<void> signOutWithGoogle() async {
    await auth.signOut();
  }
}
