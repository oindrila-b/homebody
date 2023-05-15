import 'package:flutter/material.dart';
import 'package:homebody/models/model_pet_details.dart';
import 'package:homebody/utils/colors.dart';
import 'package:homebody/widgets/widget_pet_list.dart';

class CatFilterView extends StatefulWidget {
  final String filterParameter;
  final List<PetDetails> updatedPetList;

  const CatFilterView({
    Key? key,
    required this.filterParameter,
    required this.updatedPetList,
  }) : super(key: key);

  @override
  State<CatFilterView> createState() => _CatFilterViewState();
}

class _CatFilterViewState extends State<CatFilterView> {
  @override
  Widget build(BuildContext context) {
    var filteredList = widget.updatedPetList
        .where((element) => (element.breed.toLowerCase() ==
            widget.filterParameter.toLowerCase()))
        .toList();

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: catListContainerColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: PetGridView(pets: filteredList),
    );
  }
}
