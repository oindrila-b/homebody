import 'package:flutter/material.dart';
import 'package:homebody/models/model_pet_details.dart';

import '../screens/pet_detail_page.dart';

class PetGridView extends StatefulWidget {
  final List<PetDetails> pets;

  const PetGridView({super.key, required this.pets});

  @override
  State<PetGridView> createState() => _PetGridViewState();
}

class _PetGridViewState extends State<PetGridView> {
  void _navigateToDetailsPage(PetDetails pet) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailsPage(pet: pet)));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pets.isEmpty) {
      return const Center(
        child: Text("No Data Found"),
      );
    }

    return GridView.builder(
      itemCount: widget.pets.length,
      itemBuilder: (context, index) {
        return RawMaterialButton(
          onPressed: () {
            _navigateToDetailsPage(widget.pets[index]);
          },
          child: Hero(
            tag: 'image-${widget.pets[index].name}',
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(widget.pets[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.pets[index].isAdopted
                      ? Colors.grey.withOpacity(0.8)
                      : Colors.transparent,
                ),
              ),
            ),
          ),
        );
      },
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
