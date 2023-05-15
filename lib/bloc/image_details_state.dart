
class AdoptionState {
  late bool isAdopted;

  AdoptionState({required this.isAdopted});
}

class InitialAdoptionState extends AdoptionState {
  InitialAdoptionState(): super(isAdopted: false);
}

class AdoptedState extends AdoptionState {
  AdoptedState(): super(isAdopted: true);
}
