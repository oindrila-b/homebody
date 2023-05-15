import 'package:equatable/equatable.dart';

enum Species { cat, dog }

// ignore: must_be_immutable
class PetDetails extends Equatable {
  final int id;
  final String imagePath;
  final String name;
  final String age;
  final String price;
  final String breed;
  final Species species;
  bool isAdopted;

  PetDetails({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.age,
    required this.price,
    required this.breed,
    required this.species,
    required this.isAdopted,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        age,
        price,
        isAdopted,
        species,
      ];
}
