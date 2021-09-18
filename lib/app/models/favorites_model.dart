import 'dart:convert';

class FavoritesModel {
  final List<String> petsUid;

  FavoritesModel({
    required this.petsUid,
  });

  Map<String, dynamic> toMap() {
    return {
      'petsUid': petsUid,
    };
  }

  factory FavoritesModel.fromMap(Map<String, dynamic> map) {
    return FavoritesModel(
      petsUid: List<String>.from(map['petsUid']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesModel.fromJson(String source) =>
      FavoritesModel.fromMap(json.decode(source));
}
