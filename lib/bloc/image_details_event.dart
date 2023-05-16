import 'package:homebody/models/model_pet_details.dart';

abstract class AdoptionEvent {
  const AdoptionEvent();
}

class PressedAdoptionEvent extends AdoptionEvent {
  final int id;
  final Species species;

  const PressedAdoptionEvent({
    required this.id,
    required this.species,
  });
}

class GetInitialListEvent extends AdoptionEvent {}

class GetAdoptedListEvent extends AdoptionEvent {}

