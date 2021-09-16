import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:give_me_home/app/models/pet_model.dart';
import 'package:give_me_home/app/repositories/pet_repository/pet_repository_interface.dart';

class PetRepository implements IPetRepository {
  final FirebaseFirestore firestore;

  PetRepository(this.firestore);

  @override
  Stream<List<PetModel>> getPets() {
    return firestore.collection('pets').snapshots().map((snap) =>
        snap.docs.map((doc) => PetModel.fromMap(doc.data())).toList());
  }
}
