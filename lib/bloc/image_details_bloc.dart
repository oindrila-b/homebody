
import 'package:bloc/bloc.dart';
import 'package:homebody/bloc/image_details_event.dart';
import 'package:homebody/bloc/image_details_state.dart';

class AdoptionBloc extends Bloc<AdoptionEvent, AdoptionState> {
  AdoptionBloc(): super(InitialAdoptionState()) {
    on<PressedAdoptionEvent>((event, emit) {
        emit(AdoptedState());
    });
  }

}