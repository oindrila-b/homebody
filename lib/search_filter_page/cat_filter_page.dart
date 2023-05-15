import 'package:flutter/material.dart';
import 'package:homebody/screens/dog_page_list.dart';
import 'package:homebody/utils/colors.dart';
import 'package:homebody/utils/details_dogs_cats.dart';
import 'package:homebody/utils/texts.dart';

import '../screens/ImageDetails.dart';
import '../generic_view/detail_page_model.dart';


class CatFilterView extends StatefulWidget {

  String filterParameter;

  CatFilterView({Key? key, required this.filterParameter}) : super(key: key);

  @override
  State<CatFilterView> createState() => _CatFilterViewState();
}

class _CatFilterViewState extends State<CatFilterView> {
  List<ImageDetails> catImages = catDetailsList;

  // List<ImageDetails> _filteredList = [];

  @override
  Widget build(BuildContext context) {

    var _filteredList = catImages.where((element) => (element.breed.toLowerCase() == widget.filterParameter.toLowerCase())).toList();
    print(_filteredList.length);

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
                        imagePath: _filteredList[index].imagePath,
                        name: _filteredList[index].name,
                        age: _filteredList[index].age,
                        price: _filteredList[index].price,
                        breed: _filteredList[index].breed,
                      )
                  )
              );
            },
            child: Hero(
              tag: 'image-${_filteredList[index].name}',
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(_filteredList[index].imagePath),
                        fit: BoxFit.cover,
                      )
                  )
              ),
            ),
          );
        },
        itemCount: _filteredList.length,
      ),
    );
  }
}
