import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:give_me_home/app/models/pet_model.dart';
import 'package:give_me_home/app/models/user_model.dart';
import 'package:give_me_home/app/repositories/pet_repository/pet_repository.dart';

class HomeController extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<PetModel>> getAllPets() {
    final petRepository = PetRepository(_firestore);
    return petRepository.getPets();
  }
}
