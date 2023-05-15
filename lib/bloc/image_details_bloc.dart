import 'package:bloc/bloc.dart';
import 'package:homebody/bloc/image_details_event.dart';
import 'package:homebody/bloc/image_details_state.dart';
import 'package:homebody/models/model_pet_details.dart';

import '../utils/details_dogs_cats.dart';

class AdoptionBloc extends Bloc<AdoptionEvent, AdoptionState> {
  List<PetDetails> _cats = catDetailsList, _dogs = dogDetailsList;
  List<PetDetails> _adoptedPets = [];

  AdoptionBloc() : super(const InitialAdoptionState()) {
    on<GetInitialListEvent>(_getInitialListHandler);
    on<PressedAdoptionEvent>(_adoptAPet);
  }

  void _getInitialListHandler(
      GetInitialListEvent event, Emitter<AdoptionState> emit) {
    emit(AdoptedState(dogList: _dogs, catList: _cats));
  }

  void _adoptAPet(PressedAdoptionEvent event, Emitter<AdoptionState> emit) {
    switch (event.species) {
      case Species.cat:
        int index = _cats.indexWhere((element) => element.id == event.id);
        _cats[index].isAdopted = true;
        _adoptedPets.add(_cats[index]);
        break;
      case Species.dog:
        int index = _dogs.indexWhere((element) => element.id == event.id);
        _dogs[index].isAdopted = true;
        _adoptedPets.add(_dogs[index]);
        break;
    }
    emit(AdoptionLoading());
    emit(AdoptedState(dogList: _dogs, catList: _cats));
  }
}
