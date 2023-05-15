
import 'package:equatable/equatable.dart';

class ImageDetails extends Equatable {
  late final String imagePath;
  late final String name;
  late final String age;
  late final String price;
  late final String breed;
  late bool isAdopted;


  ImageDetails(
      {required this.imagePath,
        required this.name,
        required this.age,
        required this.price,
        required this.breed
      });

  void set setIsAdopted(bool value) {
    isAdopted = value;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name,age, price, isAdopted];
}