import 'package:flutter/material.dart';
import 'package:homebody/utils/colors.dart';
import 'package:homebody/utils/details_dogs_cats.dart';
import 'package:homebody/utils/texts.dart';

import '../generic_view/detail_page_model.dart';
import 'ImageDetails.dart';


class CatPageList extends StatefulWidget {
  const CatPageList({Key? key}) : super(key: key);

  @override
  State<CatPageList> createState() => _CatPageListState();
}

class _CatPageListState extends State<CatPageList> {

  List<ImageDetails> _catsList = catDetailsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: catListContainerColor,
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
                        imagePath: _catsList[index].imagePath,
                        name: _catsList[index].name,
                        age: _catsList[index].age,
                        price: _catsList[index].price,
                        breed: _catsList[index].breed,
                      )
                  )
              );
            },
            child: Hero(
              tag: 'image-${_catsList[index].name}',
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(_catsList[index].imagePath),
                        fit: BoxFit.cover,
                      )
                  )
              ),
            ),
          );
        },
        itemCount: _catsList.length,
      ),
    );
  }
}
