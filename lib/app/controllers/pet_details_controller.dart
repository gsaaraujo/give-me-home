import 'package:flutter/cupertino.dart';

class PetDetailsController extends ChangeNotifier {
  int _petPhotoIndex = 0;

  int get petPhotoIndex => _petPhotoIndex;

  set petPhotoIndex(int newIndex) {
    _petPhotoIndex = newIndex;

    notifyListeners();
  }
}
