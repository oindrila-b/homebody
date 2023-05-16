import 'package:homebody/models/model_pet_details.dart';

abstract class AdoptionState {
  const AdoptionState();
}

class InitialAdoptionState extends AdoptionState {
  const InitialAdoptionState();
}

class AdoptedState extends AdoptionState {
  final List<PetDetails> dogList;
  final List<PetDetails> catList;


  const AdoptedState({
    required this.dogList,
    required this.catList,

  });
}

class AdoptionLoading extends AdoptionState {}

class AdoptedListState extends AdoptionState {
  final List<PetDetails> adoptedList;
  const AdoptedListState({
    required this.adoptedList,
});

}