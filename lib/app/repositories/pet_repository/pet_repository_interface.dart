import 'package:give_me_home/app/models/pet_model.dart';

abstract class IPetRepository {
  Stream<List<PetModel>> getPets();
}
