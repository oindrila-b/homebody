import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebody/bloc/image_details_bloc.dart';
import 'package:homebody/screens/adoptionHistoryPage.dart';
import 'package:homebody/screens/dogPets.dart';
import 'package:homebody/utils/colors.dart';
import '../bloc/image_details_event.dart';
import '../bloc/image_details_state.dart';
import '../models/model_pet_details.dart';
import '../utils/texts.dart';
import 'catPets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 0;

  void _navigateToCatDetails(BuildContext context, List<PetDetails> pets) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CatPets(
          pets: pets,
        ),
      ),
    );
  }

  void _navigateToDogDetails(BuildContext context, List<PetDetails> pets) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DogPets(
          pets: pets,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AdoptionBloc>().add(GetInitialListEvent());
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          homePageTitle,
        ), // app bar title
        centerTitle: true, // center alignment of the app bar
      ),
      body: (navIndex == 0) ?
      Container(
        // scaffold body
        decoration: const BoxDecoration(
          // scaffold background image
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        // column for the cat or dog adoption option
        child: Column(
          children: [
            // sized box
            Expanded(
              flex: 1,
              child: SizedBox(
                height: (MediaQuery.of(context).size.width) / 1.5,
              ),
            ),


            BlocConsumer<AdoptionBloc, AdoptionState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is InitialAdoptionState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is AdoptedState) {
                  return Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // DOGS OPTION
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // navigate to dogs list page
                              _navigateToDogDetails(
                                context,
                                state.dogList,
                              );
                            },
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              height: (MediaQuery.of(context).size.width) / 2,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      radius:
                                          60, //we give the image a radius of 60
                                      backgroundImage:
                                          AssetImage('images/bow.png'),
                                    ),
                                    Text(
                                      bow,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: dogPawColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // CATS OPTION
                        Expanded(
                          // navigate to cats list page
                          child: GestureDetector(
                            onTap: () {
                              _navigateToCatDetails(
                                context,
                                state.catList,
                              );
                            },
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              height: (MediaQuery.of(context).size.width) / 2,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      radius:
                                          60, //we give the image a radius of 50
                                      backgroundImage:
                                          AssetImage('images/meow.png'),
                                    ),
                                    Text(
                                      meow,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: catPawColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ) :
        Container(
          child: ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>   AdoptionHistoryPage()));
          },
            child: Center(child: Icon(Icons.history)),
          ),
        ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.brown
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
              backgroundColor: Colors.brown
          ),
        ],
      ),
    );
  }
}
