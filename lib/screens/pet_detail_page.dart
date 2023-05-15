import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebody/bloc/image_details_bloc.dart';
import 'package:homebody/bloc/image_details_event.dart';
import 'package:homebody/bloc/image_details_state.dart';
import 'package:homebody/models/model_pet_details.dart';
import 'package:homebody/utils/colors.dart';
import 'package:homebody/utils/texts.dart';

class DetailsPage extends StatefulWidget {
  final PetDetails pet;

  const DetailsPage({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdoptionBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.pet.name}'s Profile"),
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: appBarColor,
        ),
        body:
            BlocBuilder<AdoptionBloc, AdoptionState>(builder: (context, state) {
          return Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Hero(
                    tag: 'image-${widget.pet.name}',
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: InteractiveViewer(
                        child: Image.asset(
                          widget.pet.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 260,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name : ${widget.pet.name}',
                                style: TextStyle(
                                  color: dogPawColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Age : ${widget.pet.age}',
                                style: TextStyle(
                                  color: dogPawColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Price : \$${widget.pet.price}',
                                style: TextStyle(
                                  color: dogPawColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Breed : ${widget.pet.breed}',
                                style: TextStyle(
                                  color: dogPawColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: ElevatedButton(
                            onPressed: !widget.pet.isAdopted
                                ? () {
                                    BlocProvider.of<AdoptionBloc>(context).add(
                                      PressedAdoptionEvent(
                                        id: widget.pet.id,
                                        species: widget.pet.species,
                                      ),
                                    );
                                    showAdoptedDialog();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !widget.pet.isAdopted
                                  ? Colors.green
                                  : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: !widget.pet.isAdopted
                                ? Text(adoption)
                                : const Text("Already Adopted!"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  // TODO
  void showAdoptedDialog() {

    showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text("🎊🎊🎉🎉"),
        content: Text("Congratulations!! You've now adopted ${widget.pet.name}",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
      );
    });
  }

    // Get.defaultDialog(
    //   title: "🎊🎊🎉🎉",
    //   content: Text(
    //     "Congratulations !! You've now Adopted ${widget.pet.name} !!",
    //     style: const TextStyle(
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // );
  }

