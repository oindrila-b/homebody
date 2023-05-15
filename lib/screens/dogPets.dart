import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homebody/screens/dog_page_list.dart';
import 'package:homebody/utils/colors.dart';
import '../utils/texts.dart';
import '../search-related/DogSearchDelegate.dart';


class DogPets extends StatelessWidget {
  const DogPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackground,
      appBar: AppBar(
        title: Text(search, style: TextStyle(color: Colors.black, fontSize: 18),),
        backgroundColor: mainBackground,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(onPressed: () {
            showSearch(
                context: context,
                delegate: DogSearchDelegate());
          },
              icon: const Icon(Icons.search_rounded, color: Colors.black,))
        ],
      ),
      body: Container(
        color: mainBackground,
        child: Column(
          children: [
            // dogs image
            Expanded(
                flex: 3,
                child: Container(
                  color: mainBackground,
                 child: Image(
                   image: AssetImage('images/dog_page_group.png'),
                 ),
                )
            ),

            // list view area
            Expanded(
                flex: 10,
                child: Container(
                  color: mainBackground,
                  child: DogPageList(),
                )
            ),
          ],
        ),
      ),
    );
  }

}


