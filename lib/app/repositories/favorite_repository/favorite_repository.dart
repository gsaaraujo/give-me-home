import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:give_me_home/app/models/favorites_model.dart';
import 'package:give_me_home/app/repositories/favorite_repository/favorite_repository_interface.dart';
import 'package:give_me_home/app/repositories/pet_repository/pet_repository.dart';

class FavoriteRepository implements IFavoriteRepositoryInterface {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FavoriteRepository(this.firestore, this.auth);

  @override
  Future createFavoritesIfNotExists() async {
    final favorites = firestore.collection('favorites');
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      try {
        favorites.doc(currentUser.uid).set({
          'petsUid': [],
        });
      } catch (e) {
        throw Exception('Failed to create Favorite');
      }
    }
  }

  @override
  Future<void> addToFavorites(String uid) async {
    final favorites = firestore.collection('favorites');
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      try {
        final currentFavorites = await favorites.doc(currentUser.uid).get();

        final isAlreadyInArray =
            FavoritesModel.fromMap(currentFavorites.data()!)
                .petsUid
                .contains(uid);

        if (isAlreadyInArray) {
          favorites.doc(currentUser.uid).update({
            'petsUid': FieldValue.arrayRemove([uid]),
          });
        } else {
          favorites.doc(currentUser.uid).update({
            'petsUid': FieldValue.arrayUnion([uid]),
          });
        }
      } catch (e) {
        throw Exception('Failed to add Favorite $e');
      }
    }
  }

  @override
  Future<void> getFromFavorites(String uid) async {
    final favorites = firestore.collection('favorites');
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      try {
        favorites.doc(currentUser.uid).update({
          'favorites': uid,
        });
      } catch (e) {
        throw Exception('Failed to get Favorite');
      }
    }
  }

  @override
  Future<void> removeFromFavorites(String uid) async {}
}
