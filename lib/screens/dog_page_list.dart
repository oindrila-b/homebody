import 'package:flutter/material.dart';
import 'package:homebody/utils/colors.dart';
import 'package:homebody/utils/details_dogs_cats.dart';
import 'ImageDetails.dart';
import '../generic_view/detail_page_model.dart';

class DogPageList extends StatefulWidget {

  const DogPageList({Key? key}) : super(key: key);

  @override
  State<DogPageList> createState() => _DogPageListState();
}

class _DogPageListState extends State<DogPageList> {

  List<ImageDetails> _dogList = dogDetailsList;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: dogListContainerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: GridView.builder(
        padding:  EdgeInsets.all(16.0) ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return RawMaterialButton(
                onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          imagePath: _dogList[index].imagePath,
                          name: _dogList[index].name,
                          age: _dogList[index].age,
                          price: _dogList[index].price,
                          breed: _dogList[index].breed,
                        )
                    )
                );
                },
                child: Hero(
                  tag: 'image-${_dogList[index].name}',
                  child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(_dogList[index].imagePath),
                      fit: BoxFit.cover,
                    )
            )
            ),
                ),
            );
          },
        itemCount: _dogList.length,
          ),
    );
  }
}


