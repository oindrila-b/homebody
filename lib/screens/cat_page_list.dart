import 'package:flutter/material.dart';
import 'package:homebody/models/model_pet_details.dart';
import 'package:homebody/utils/colors.dart';
import '../widgets/widget_pet_list.dart';

class CatPageList extends StatefulWidget {
  final List<PetDetails> cats;
  const CatPageList({Key? key, required this.cats}) : super(key: key);

  @override
  State<CatPageList> createState() => _CatPageListState();
}

class _CatPageListState extends State<CatPageList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: catListContainerColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: PetGridView(
        key: Key("CatPageView"),
        pets: widget.cats,
      ),
    );
  }
}
