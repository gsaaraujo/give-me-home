import 'package:give_me_home/app/models/pet_model.dart';

abstract class IPetRepositoryInterface {
  Stream<List<PetModel>> getPets();
}
