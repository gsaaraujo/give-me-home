import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:give_me_home/app/models/pet_model.dart';
import 'package:give_me_home/app/services/auth_services.dart';
import 'package:give_me_home/app/repositories/pet_repository/pet_repository.dart';

class HomeController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signOut() async {
    await AuthServices(_auth, _firestore).signOutWithGoogle();
  }

  Stream<List<PetModel>> getAllPets() {
    final petRepository = PetRepository(_firestore);
    return petRepository.getPets();
  }
}
