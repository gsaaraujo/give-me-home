import 'dart:convert';

class PetModel {
  final String uid;
  final String name;
  final String breed;
  final String gender;
  final String size;
  final String about;
  final List<String> photos;

  PetModel({
    required this.uid,
    required this.name,
    required this.breed,
    required this.gender,
    required this.size,
    required this.about,
    required this.photos,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'breed': breed,
      'gender': gender,
      'size': size,
      'about': about,
      'photos': photos,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      uid: map['uid'],
      name: map['name'],
      breed: map['breed'],
      gender: map['gender'],
      size: map['size'],
      about: map['about'],
      photos: List<String>.from(map['photos']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source));
}
