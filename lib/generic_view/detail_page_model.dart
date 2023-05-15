import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:homebody/bloc/image_details_bloc.dart';
import 'package:homebody/bloc/image_details_event.dart';
import 'package:homebody/bloc/image_details_state.dart';
import 'package:homebody/utils/colors.dart';
import 'package:homebody/utils/texts.dart';

import '../screens/adoptionHistoryPage.dart';


class DetailsPage extends StatefulWidget {
  final String imagePath;
  final String name;
  final String age;
  final String price;
  final String breed;

  const DetailsPage
      ({Key? key, required this.imagePath,
    required this.name,
    required this.age,
    required this.price,
    required this.breed, }) : super(key: key);

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
          title: Text("${widget.name}\'s Profile"),
          leading: BackButton(
            onPressed: ()=>Navigator.pop(context),
          ),
          backgroundColor: appBarColor,
        ),
        body: BlocBuilder<AdoptionBloc, AdoptionState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Hero(
                        tag: 'image-${widget.name}',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: InteractiveViewer(
                            child: Image.asset(widget.imagePath, fit: BoxFit
                                .contain,),
                          ),
                        ),
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 260,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: Column(
                              children: [
                                Container(
                                  child: Text('Name : ${widget.name}',
                                    style: TextStyle(
                                      color: dogPawColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  child: Text('Age : ${widget.age}',
                                    style: TextStyle(
                                      color: dogPawColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  child: Text('Price : \$${widget.price}',
                                    style: TextStyle(
                                      color: dogPawColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  child: Text('Breed : ${widget.breed}',
                                    style: TextStyle(
                                      color: dogPawColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ],
                            ),
                          ),
                          Expanded(child:
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: !state.isAdopted ?
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AdoptionBloc>(context).add(PressedAdoptionEvent());
                                showAdoptedDialog();
                                print("Pressed Adopt me! ${state.isAdopted}");
                              },
                              child: Text(
                                  adoption
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ) :
                              ElevatedButton(onPressed: () {
                                print("Already Adopted!${state.isAdopted}");
                              }, child:  Text(
                                  "Already Adopted!"
                              ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                          )
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  void showAdoptedDialog() {
    print("Showing adopted dialog");
    Get.defaultDialog(
      title: "🎊🎊🎉🎉",
      content: Container(
        child: Text(
            "Congratulations !! You've now Adopted ${widget.name} !!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
