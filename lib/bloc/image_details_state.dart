import 'package:homebody/models/model_pet_details.dart';

abstract class AdoptionState {
  const AdoptionState();
}

class InitialAdoptionState extends AdoptionState {
  const InitialAdoptionState();
}

class AdoptedState extends AdoptionState {
  final List<PetDetails> dogList, catList;

  const AdoptedState({
    required this.dogList,
    required this.catList,
  });
}

class AdoptionLoading extends AdoptionState {}
