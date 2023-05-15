import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:homebody/screens/catPets.dart';
import 'package:homebody/screens/dogPets.dart';
import 'package:homebody/utils/colors.dart';
import '../utils/texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text(homePageTitle,), // app bar title
          centerTitle: true, // center alignment of the app bar
        ),
      body: Container(
        // scaffold body
        decoration: BoxDecoration(
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
        child : SizedBox(
              height: (MediaQuery.of(context).size.width) / 1.5,
            ),
        ),

        // DOGS OPTION
            Expanded(
              flex: 2,
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => DogPets(), transition: Transition.leftToRightWithFade);
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width) / 2,
                    height: (MediaQuery.of(context).size.width) / 2,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const CircleAvatar(
                        radius: 60, //we give the image a radius of 50
                        backgroundImage: AssetImage('images/bow.png'),
                      ),
                      Text(bow,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: dogPawColor
                      ),
                      )
                      ],
                      ),
                    ),
                  ),
                ),
              ),

           // CATS OPTION
           Expanded(
               child: GestureDetector(
                 onTap: () {
                   Get.to(() => CatPets(), transition: Transition.rightToLeftWithFade);
                 },
                 child: Container(
                  width: (MediaQuery.of(context).size.width) / 2,
                  height: (MediaQuery.of(context).size.width) / 2,
                   child : Card(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const CircleAvatar(
                           radius: 60, //we give the image a radius of 50
                           backgroundImage: AssetImage('images/meow.png'),
                         ),
                         Text(meow,
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: catPawColor
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
                ),
              ],
            ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: (MediaQuery.of(context).size.width) / 1.5,
              ),
            ),
           ],
        ),
      ),
    );
  }
}
