import 'package:flutter/material.dart';
import 'package:homebody/models/model_pet_details.dart';
import 'package:homebody/utils/colors.dart';
import '../widgets/widget_pet_list.dart';

class DogPageList extends StatefulWidget {
  final List<PetDetails> dogs;
  const DogPageList({Key? key, required this.dogs}) : super(key: key);

  @override
  State<DogPageList> createState() => _DogPageListState();
}

class _DogPageListState extends State<DogPageList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: dogListContainerColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: PetGridView(
        key: Key("DogPageView"),
        pets: widget.dogs,
      ),
    );
  }
}
